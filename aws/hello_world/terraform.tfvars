hello_world_aws_region  = "us-east-1"

hello_world_aws_vpc_name = "ts_vpc"
hello_world_aws_vpc_cidr_block = "10.0.0.0/16"

hello_world_aws_subnet_public_igw_cidr_block = "10.0.10.0/24"
hello_world_aws_subnet_public_igw_availability_zone = "us-east-1b"
hello_world_aws_subnet_public_igw_tags = {
  "Name" = "ts public igw"
}
hello_world_aws_route_table_public_igw_tags = {
  "Name" = "ts public igw"
}
hello_world_aws_internet_gateway_tags = {
  "Name" = "ts igw"
}

hello_world_aws_subnet_private_ngw_cidr_block = "10.0.20.0/24"
hello_world_aws_subnet_private_ngw_availability_zone = "us-east-1d"
hello_world_aws_subnet_private_ngw_tags = {
  "Name" = "ts private ngw"
}
hello_world_aws_route_table_private_ngw_tags = {
  "Name" = "ts private ngw"
}
hello_world_aws_nat_gateway_tags = {
  "Name" = "ts ngw"
}

hello_world_aws_subnet_private_airgap_cidr_block = "10.0.30.0/24"
hello_world_aws_subnet_private_airgap_availability_zone = "us-east-1f"
hello_world_aws_subnet_private_airgap_tags = {
  "Name" = "ts private airgap"
}
hello_world_aws_route_table_private_airgap_tags = {
  "Name" = "ts private airgap"
}