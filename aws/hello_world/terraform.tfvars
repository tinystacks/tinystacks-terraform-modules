hello_world_aws_region  = "us-east-1"

hello_world_aws_vpc_name = "ts_vpc"
hello_world_aws_vpc_cidr_block = "10.0.0.0/16"
hello_world_aws_vpc_cidr_newbits = 4

hello_world_public_igw_cidr_blocks = {
  "us-east-1b" = 1
  "us-east-1d" = 2
  "us-east-1f" = 3
}
hello_world_aws_route_table_public_igw_tags = {
  "Name" = "ts public igw"
}
hello_world_aws_internet_gateway_tags = {
  "Name" = "ts igw"
}

hello_world_private_ngw_cidr_blocks = {
  "us-east-1b" = 4
  "us-east-1d" = 5
  "us-east-1f" = 6
}
hello_world_aws_route_table_private_ngw_tags = {
  "Name" = "ts private ngw"
}
hello_world_aws_nat_gateway_tags = {
  "Name" = "ts ngw"
}

hello_world_private_airgap_cidr_blocks = {
  "us-east-1b" = 7
  "us-east-1d" = 8
  "us-east-1f" = 9
}
hello_world_aws_route_table_private_airgap_tags = {
  "Name" = "ts private airgap"
}