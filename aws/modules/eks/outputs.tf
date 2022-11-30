output "eks_cluster_iam_role" {
  value = {
    name = aws_iam_role.eks_role.name,
    arn  = aws_iam_role.eks_role.arn
  }
}

output "eks_node_iam_role" {
  value = {
    name = aws_iam_role.node_group_role.name
    arn  = aws_iam_role.node_group_role.arn
  }
}

#output "test" {
#  value = module.alb_controller.test
#}