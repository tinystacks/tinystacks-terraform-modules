

resource "aws_eks_cluster" "cluster" {
  name     = var.STACK_NAME
  role_arn = aws_iam_role.eks_role.arn
  version  = "1.20"
  vpc_config {
    subnet_ids = [for subnet in var.subnets : subnet]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.amazonEKSClusterPolicy
  ]
}

resource "aws_iam_openid_connect_provider" "cluster" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
  url             = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_role" "eks_role" {
  name = "eks-role-${var.STACK_NAME}"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "amazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "nodes-${var.STACK_NAME}"
  node_role_arn   = aws_iam_role.node_group_role.arn
  subnet_ids      = [for subnet in var.subnets : subnet]
  disk_size       = var.node_disk_size
  instance_types  = var.instance_types
  scaling_config {
    desired_size = var.desired_node_count
    max_size     = var.max_node_count
    min_size     = var.min_node_count
  }

  update_config {
    max_unavailable = var.max_unavailable_nodes
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
  ]
}

resource "aws_iam_role" "node_group_role" {
  name = "eks-node-group-${var.STACK_NAME}"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.node_group_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.node_group_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node_group_role.name
}

#helm

resource "helm_release" "release" {
  name            = var.helm_release_name
  chart           = var.helm_path
  values          = [yamlencode(var.env_variables)]
  force_update    = true
  reset_values    = true
  recreate_pods   = true
  cleanup_on_fail = true
  lint            = true

  dynamic "set" {
    for_each = var.values
    content {
      name  = set.value["name"]
      value = set.value["value"]
    }
  }
}


module "alb_controller" {
  source                    = "../eks_alb_controller"
  cluster_oidc_provider_url = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
  cluster_endpoint          = aws_eks_cluster.cluster.endpoint
  cluster_certificate       = aws_eks_cluster.cluster.certificate_authority[0].data
  STACK_NAME = var.STACK_NAME
}