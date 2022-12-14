output "hello_world_aws_vpc_id" {
  description = "Hello World AWS VPC ID"
  value       = module.ts_aws_vpc_hello_world.ts_aws_vpc_id
}

output "hello_world_aws_rds_postgres_endpoint" {
  description = "Hello World AWS RDS Postgres Endpoint"
  value = module.hello_world_aws_rds_postgres.ts_aws_db_instance_endpoint
}

output "hello_world_aws_rds_postgres_username" {
  description = "Hello World AWS RDS Postgres username"
  value = module.hello_world_aws_rds_postgres.ts_aws_db_instance_username
}

output "hello_world_aws_rds_postgres_password" {
  description = "Hello World AWS RDS Postgres password"
  value = module.hello_world_aws_rds_postgres.ts_aws_db_instance_password
  sensitive = true
}

output "hello_world_aws_rds_postgres_db_name" {
  description = "Hello World AWS RDS Postgres DB name"
  value = module.hello_world_aws_rds_postgres.ts_aws_db_instance_db_name
}

output "hello_ts_aws_eks_cluster_endpoint" {
  description = "Hello TS AWS EKS Cluster endpoint"
  value = module.hello_ts_aws_eks_cluster.ts_aws_eks_cluster_endpoint
}

output "hello_ts_aws_eks_cluster_certificate_authority_data" {
  description = "Hello TS AWS EKS Cluster CA Data"
  value = module.hello_ts_aws_eks_cluster.ts_aws_eks_cluster_certificate_authority_data
}

output "hello_ts_aws_eks_cluster_region" {
  description = "Hello TS AWS EKS Cluster region"
  value       = data.aws_region.current.name
}

output "hello_ts_aws_eks_cluster_name" {
  description = "Hello TS AWS EKS Cluster name"
  value       = module.hello_ts_aws_eks_cluster.ts_aws_eks_cluster_name
}