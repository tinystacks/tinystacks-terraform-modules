module "vpc" {
  source = "../vpc"

}

resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [for subnet in module.vpc.ts_aws_subnet_public_igw_map: subnet]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.amazonEKSClusterPolicy
  ]
}

resource "aws_iam_role" "eks_role" {
  name = "eks-role-${var.cluster_name}"

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
  node_group_name = "nodes-${var.cluster_name}"
  node_role_arn   = aws_iam_role.node_group_role.arn
  subnet_ids      = [for subnet in module.vpc.ts_aws_subnet_public_igw_map: subnet]
  disk_size = var.node_disk_size
  instance_types = var.instance_types
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
  name = "eks-node-group-${var.cluster_name}"

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
  name       = var.helm_release_name
  repository = var.helm_repository
  chart      = var.helm_chart_name

  values = var.helm_values_files

  dynamic "set_sensitive" {
    for_each = var.sensitive_values
    content {
      name  = set_sensitive.value["name"]
      value = set_sensitive.value["value"]
    }
  }
}

#alb

module "alb" {
  source = "../alb"
  alb_only = true
  ts_aws_alb_name = "test"
  ts_aws_alb_internal = false
  ts_aws_alb_subnets = [for subnet in module.vpc.ts_aws_subnet_public_igw_map: subnet]
  ts_aws_alb_security_groups = [module.vpc.vpc_security_group_id]
  alb_tags = {
    "ingress.k8s.aws/stack" = var.stack_name
    "ingress.k8s.aws/resource" = "LoadBalancer"
    "elbv2.k8s.aws/cluster" = aws_eks_cluster.cluster.name
  }
}

module "alb_ingress_controller" {
  source  = "../terraform-kubernetes-alb-ingress-controller"

  providers = {
    kubernetes = kubernetes.eks
  }

  k8s_cluster_type = "eks"
  k8s_namespace    = "default"

  aws_region_name  = var.region
  k8s_cluster_name = aws_eks_cluster.cluster.name
}