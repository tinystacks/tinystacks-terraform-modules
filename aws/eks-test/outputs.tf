output "eks_cluster_iam_role" {
  value = module.eks.eks_cluster_iam_role
}

output "eks_node_iam_role" {
  value = module.eks.eks_node_iam_role
}

output "test" {
  value = module.eks.test
}