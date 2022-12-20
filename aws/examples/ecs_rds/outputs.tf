output "hello_world_aws_vpc_id" {
  description = "Hello World AWS VPC ID"
  value       = module.ts_aws_vpc_hello_world.ts_aws_vpc_id
}

output "hello_world_aws_subnet_public_igw_map" {
  description = "Hello World AWS Subnet Public IGW ID"
  value       = module.ts_aws_vpc_hello_world.ts_aws_subnet_public_igw_map
}

output "hello_world_aws_subnet_private_ngw_map" {
  description = "Hello World AWS Subnet Private NGW ID"
  value       = module.ts_aws_vpc_hello_world.ts_aws_subnet_private_ngw_map
}

output "hello_world_aws_subnet_private_isolated_map" {
  description = "Hello World AWS Subnet Private isolated ID"
  value       = module.ts_aws_vpc_hello_world.ts_aws_subnet_private_isolated_map
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