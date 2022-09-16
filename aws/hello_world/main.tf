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
  profile = var.hello_world_aws_profile
}

module "ts_aws_vpc_hello_world" {
  source = "../modules/ts_aws_vpc"

  ts_aws_vpc_name       = var.hello_world_aws_vpc_name
  ts_aws_vpc_cidr_block = var.hello_world_aws_vpc_cidr_block

  ts_aws_subnet_public_igw_cidr_block        = var.hello_world_aws_subnet_public_igw_cidr_block
  ts_aws_subnet_public_igw_availability_zone = var.hello_world_aws_subnet_public_igw_availability_zone
  ts_aws_subnet_public_igw_tags              = var.hello_world_aws_subnet_public_igw_tags
  ts_aws_route_table_public_igw_tags         = var.hello_world_aws_route_table_public_igw_tags
  ts_aws_internet_gateway_tags               = var.hello_world_aws_internet_gateway_tags

  ts_aws_subnet_private_ngw_cidr_block        = var.hello_world_aws_subnet_private_ngw_cidr_block
  ts_aws_subnet_private_ngw_availability_zone = var.hello_world_aws_subnet_private_ngw_availability_zone
  ts_aws_subnet_private_ngw_tags              = var.hello_world_aws_subnet_private_ngw_tags
  ts_aws_route_table_private_ngw_tags         = var.hello_world_aws_route_table_private_ngw_tags
  ts_aws_nat_gateway_tags                     = var.hello_world_aws_nat_gateway_tags

  ts_aws_subnet_private_airgap_cidr_block        = var.hello_world_aws_subnet_private_airgap_cidr_block
  ts_aws_subnet_private_airgap_availability_zone = var.hello_world_aws_subnet_private_airgap_availability_zone
  ts_aws_subnet_private_airgap_tags              = var.hello_world_aws_subnet_private_airgap_tags
  ts_aws_route_table_private_airgap_tags         = var.hello_world_aws_route_table_private_airgap_tags

}