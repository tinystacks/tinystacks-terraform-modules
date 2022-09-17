output "ts_aws_vpc_id" {
  description = "TinyStacks AWS VPC ID"
  value       = aws_vpc.ts_aws_vpc.id
}

output "ts_aws_subnet_public_igw_map" {
  description = "TinyStacks AWS Subnet Public IGW ID and block"
  value = {
    for subnet in aws_subnet.ts_aws_subnet_public_igw :
    subnet.id => subnet.cidr_block
  }
}

output "ts_aws_subnet_private_ngw_map" {
  description = "TinyStacks AWS Subnet Private NGW ID and block"
  value = {
    for subnet in aws_subnet.ts_aws_subnet_private_ngw :
    subnet.id => subnet.cidr_block
  }
}

output "ts_aws_subnet_private_airgap_map" {
  description = "TinyStacks AWS Subnet Private airgap ID and block"
  value = {
    for subnet in aws_subnet.ts_aws_subnet_private_airgap :
    subnet.id => subnet.cidr_block
  }
}