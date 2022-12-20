output "ts_aws_eks_cluster_endpoint" {
  description = "AWS EKS Cluster endpoint"
  value = aws_eks_cluster.ts_aws_eks_cluster.endpoint
}

output "ts_aws_eks_cluster_certificate_authority_data" {
  description = "AWS EKS Cluster CA Data"
  value = aws_eks_cluster.ts_aws_eks_cluster.certificate_authority[0].data
}

output "ts_aws_eks_cluster_name" {
  description = "AWS EKS Cluster name"
  value       = aws_eks_cluster.ts_aws_eks_cluster.name
}