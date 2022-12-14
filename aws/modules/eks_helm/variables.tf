variable "ts_aws_eks_cluster_name" {
  description = "AWS EKS Cluster name"
  type        = string
}

variable "ts_aws_eks_cluster_endpoint" {
  description = "AWS EKS Cluster endpoint"
  type        = string
}

variable "ts_aws_eks_cluster_ca_certificate" {
  description = "AWS EKS Cluster CA certificate"
  type        = string
}

variable "ts_aws_eks_helm_release_name" {
  description = "AWS EKS Helm release name"
  type        = string
  default     = "kubewatch"
}

variable "ts_aws_eks_helm_release_repository" {
  description = "AWS EKS Helm release repository"
  type        = string
  default     = "https://charts.bitnami.com/bitnami"
}

variable "ts_aws_eks_helm_release_chart" {
  description = "AWS EKS Helm release chart"
  type        = string
  default     = "kubewatch"
}

variable "ts_aws_eks_helm_release_values" {
  description = "AWS EKS Helm release values"
  type        = list
  default     = []
}