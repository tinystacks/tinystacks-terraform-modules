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
  source = "../modules/vpc"

  ts_aws_vpc_cidr_block   = var.hello_world_aws_vpc_cidr_block
  ts_aws_vpc_cidr_newbits = var.hello_world_aws_vpc_cidr_newbits

  ts_public_igw_cidr_blocks       = var.hello_world_public_igw_cidr_blocks
  ts_private_ngw_cidr_blocks      = var.hello_world_private_ngw_cidr_blocks
  ts_private_isolated_cidr_blocks = var.hello_world_private_isolated_cidr_blocks

}

/* EC2 Example */

module "hello_world_aws_security_group" {
  source = "../modules/security_group"

  ts_aws_security_group_vpc_id = module.ts_aws_vpc_hello_world.ts_aws_vpc_id
  ts_aws_security_group_rules  = var.hello_world_vpc_security_group_rules

}

module "hello_world_aws_instance_public_igw" {
  source = "../modules/instance"

  for_each = var.hello_world_public_igw_cidr_blocks

  ts_vpc_security_group_ids = [module.hello_world_aws_security_group.ts_aws_security_group_id]
  ts_aws_subnet_id          = module.ts_aws_vpc_hello_world.ts_aws_subnet_public_igw_map[each.key]

  ts_aws_ami_filter_name_values = var.hello_world_aws_ami_filter_name_values
  ts_aws_ami_owners             = var.hello_world_aws_ami_owners
  ts_aws_instance_type          = var.hello_world_aws_instance_type
  ts_aws_instance_key_name      = var.hello_world_aws_instance_key_name

}

/* ElastiCache Redis Example */

module "hello_world_elasticache_redis_security_group" {
  source = "../modules/security_group"

  ts_aws_security_group_vpc_id = module.ts_aws_vpc_hello_world.ts_aws_vpc_id
  ts_aws_security_group_rules  = var.hello_world_elasticache_redis_security_group_rules

}

module "hello_world_elasticache_redis_cluster" {
  source = "../modules/elasticache_redis"

  ts_aws_elasticache_subnet_group_subnet_ids                      = values(module.ts_aws_vpc_hello_world.ts_aws_subnet_private_ngw_map)
  ts_aws_elasticache_replication_group_security_group_ids         = [module.hello_world_elasticache_redis_security_group.ts_aws_security_group_id]
  ts_aws_elasticache_replication_group_id                         = var.hello_world_aws_elasticache_replication_group_id
  ts_aws_elasticache_replication_group_description                = var.hello_world_aws_elasticache_replication_group_description
  ts_aws_elasticache_replication_group_node_type                  = var.hello_world_aws_elasticache_replication_group_node_type
  ts_aws_elasticache_replication_group_port                       = var.hello_world_aws_elasticache_replication_group_port
  ts_aws_elasticache_replication_group_parameter_group_name       = var.hello_world_aws_elasticache_replication_group_parameter_group_name
  ts_aws_elasticache_replication_group_snapshot_retention_limit   = var.hello_world_aws_elasticache_replication_group_snapshot_retention_limit
  ts_aws_elasticache_replication_group_snapshot_window            = var.hello_world_aws_elasticache_replication_group_snapshot_window
  ts_aws_elasticache_replication_group_automatic_failover_enabled = var.hello_world_aws_elasticache_replication_group_automatic_failover_enabled
  ts_aws_elasticache_replication_group_replicas_per_node_group    = var.hello_world_aws_elasticache_replication_group_replicas_per_node_group
  ts_aws_elasticache_replication_group_num_node_groups            = var.hello_world_aws_elasticache_replication_group_num_node_groups

}

