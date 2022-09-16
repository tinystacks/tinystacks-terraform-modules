output "ts_aws_vpc_id" {
  description = "TinyStacks AWS VPC ID"
  value       = aws_vpc.ts_aws_vpc.id
}

output "ts_aws_subnet_public_igw_id" {
  description = "TinyStacks AWS Subnet Public IGW ID"
  value       = aws_subnet.ts_aws_subnet_public_igw.id
}

output "ts_aws_subnet_private_ngw_id" {
  description = "TinyStacks AWS Subnet Private NGW ID"
  value       = aws_subnet.ts_aws_subnet_private_ngw.id
}

output "ts_aws_subnet_private_airgap_id" {
  description = "TinyStacks AWS Subnet Private airgap ID"
  value       = aws_subnet.ts_aws_subnet_private_airgap.id
}