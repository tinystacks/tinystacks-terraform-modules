terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.31.0"
    }
  }
}

provider "aws" {
  region  = var.hello_world_aws_region
}

module "ts_aws_vpc_hello_world" {
  source = "../modules/ts_aws_vpc"

  ts_aws_vpc_name         = var.hello_world_aws_vpc_name
  ts_aws_vpc_cidr_block   = var.hello_world_aws_vpc_cidr_block
  ts_aws_vpc_cidr_newbits = var.hello_world_aws_vpc_cidr_newbits

  ts_public_igw_cidr_blocks          = var.hello_world_public_igw_cidr_blocks
  ts_aws_route_table_public_igw_tags = var.hello_world_aws_route_table_public_igw_tags
  ts_aws_internet_gateway_tags       = var.hello_world_aws_internet_gateway_tags

  ts_private_ngw_cidr_blocks          = var.hello_world_private_ngw_cidr_blocks

  ts_private_airgap_cidr_blocks             = var.hello_world_private_airgap_cidr_blocks
  ts_aws_route_table_private_airgap_tags = var.hello_world_aws_route_table_private_airgap_tags

}