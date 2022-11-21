provider "kubernetes" {
  config_path    = "~/.kube/config"
  alias = "eks"
  host                   = aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.cluster.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1"
      args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.cluster.name]
      command     = "aws"
    }

}
//TODO: set up k8 provider and continue ALB module