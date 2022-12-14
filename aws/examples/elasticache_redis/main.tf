terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.31.0"
    }
  }
}

module "ts_aws_vpc_hello_world" {
  source = "../../modules/vpc"

  ts_aws_vpc_cidr_block   = var.hello_world_aws_vpc_cidr_block
  ts_aws_vpc_cidr_newbits = var.hello_world_aws_vpc_cidr_newbits

  ts_vpc_slice_azs             = var.hello_world_slice_azs
  ts_vpc_slice_azs_start_index = var.hello_world_slice_start_index
  ts_vpc_slice_azs_end_index   = var.hello_world_slice_end_index

}

/* EC2 Example */

module "hello_world_aws_security_group" {
  source = "../../modules/security_group"

  ts_aws_security_group_vpc_id = module.ts_aws_vpc_hello_world.ts_aws_vpc_id
  ts_aws_security_group_rules  = var.hello_world_vpc_security_group_rules

}

module "hello_world_aws_instance_public_igw" {
  source = "../../modules/instance"

  for_each = module.ts_aws_vpc_hello_world.ts_aws_subnet_public_igw_map

  ts_vpc_security_group_ids = [module.hello_world_aws_security_group.ts_aws_security_group_id]
  ts_aws_subnet_id          = module.ts_aws_vpc_hello_world.ts_aws_subnet_public_igw_map[each.key]

  ts_aws_ami_filter_name_values = var.hello_world_aws_ami_filter_name_values
  ts_aws_ami_owners             = var.hello_world_aws_ami_owners
  ts_aws_instance_type          = var.hello_world_aws_instance_type
  ts_aws_instance_key_name      = var.hello_world_aws_instance_key_name

}

/* ElastiCache Redis Example */

module "hw_redis_cluster" {
  source = "../../modules/elasticache_redis"

  ec_vpc_id                     = module.ts_aws_vpc_hello_world.ts_aws_vpc_id
  ec_vpc_cidr                   = var.hello_world_aws_vpc_cidr_block
  ec_subnet_ids                 = values(module.ts_aws_vpc_hello_world.ts_aws_subnet_private_ngw_map)
  ec_id                         = var.hw_id
  ec_description                = var.hw_description
  ec_node_type                  = var.hw_node_type
  ec_port                       = var.hw_port
  ec_parameter_group_name       = var.hw_parameter_group_name
  ec_snapshot_retention_limit   = var.hw_snapshot_retention_limit
  ec_snapshot_window            = var.hw_snapshot_window
  ec_replicas_per_node_group    = var.hw_replicas_per_node_group
  ec_num_node_groups            = var.hw_num_node_groups

}

