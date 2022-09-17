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

output "hello_world_aws_subnet_private_airgap_map" {
  description = "Hello World AWS Subnet Private airgap ID"
  value       = module.ts_aws_vpc_hello_world.ts_aws_subnet_private_airgap_map
}