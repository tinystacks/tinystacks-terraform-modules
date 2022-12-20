provider "helm" {
  kubernetes {
    host                   = var.ts_aws_eks_cluster_endpoint
    cluster_ca_certificate = base64decode(var.ts_aws_eks_cluster_ca_certificate)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", var.ts_aws_eks_cluster_name]
      command     = "aws"
    }
  }
}

resource "helm_release" "kubewatch" {
  name       = var.ts_aws_eks_helm_release_name
  repository = var.ts_aws_eks_helm_release_repository
  chart      = var.ts_aws_eks_helm_release_chart
  values     = var.ts_aws_eks_helm_release_values

}