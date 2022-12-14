terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.31.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0.1"
    }
  }
}

data "aws_region" "current" {}

module "ts_aws_vpc_hello_world" {
  source = "../../modules/vpc"

  ts_aws_vpc_cidr_block   = var.hello_world_aws_vpc_cidr_block
  ts_aws_vpc_cidr_newbits = var.hello_world_aws_vpc_cidr_newbits

  ts_vpc_slice_azs             = var.hello_world_slice_azs
  ts_vpc_slice_azs_start_index = var.hello_world_slice_start_index
  ts_vpc_slice_azs_end_index   = var.hello_world_slice_end_index

}

/* RDS */

module "hello_world_aws_db_security_group" {
  source = "../../modules/security_group"

  ts_aws_security_group_vpc_id = module.ts_aws_vpc_hello_world.ts_aws_vpc_id
  ts_aws_security_group_rules  = var.hello_world_aws_db_vpc_security_group_rules

}

module "hello_world_aws_rds_postgres" {
  source = "../../modules/rds"

  ts_aws_db_instance_identifier_name         = var.hello_world_aws_db_instance_identifier_name
  ts_aws_db_instance_class                   = var.hello_world_aws_db_instance_class
  ts_aws_db_instance_allocated_storage       = var.hello_world_aws_db_instance_allocated_storage
  ts_aws_db_instance_engine                  = var.hello_world_aws_db_instance_engine
  ts_aws_db_instance_engine_version          = var.hello_world_aws_db_instance_engine_version
  ts_aws_db_instance_port                    = var.hello_world_aws_db_instance_port
  ts_aws_db_instance_skip_final_snapshot     = var.hello_world_aws_db_instance_skip_final_snapshot
  ts_aws_db_instance_storage_type            = var.hello_world_aws_db_instance_storage_type
  ts_aws_db_instance_storage_encrypted       = var.hello_world_aws_db_instance_storage_encrypted
  ts_aws_db_instance_multi_az                = var.hello_world_aws_db_instance_multi_az
  ts_aws_db_instance_vpc_security_group_ids  = [module.hello_world_aws_db_security_group.ts_aws_security_group_id]
  ts_aws_db_instance_subnet_ids              = values(module.ts_aws_vpc_hello_world.ts_aws_subnet_private_ngw_map)
  ts_aws_db_instance_backup_retention_period = var.hello_world_aws_db_instance_backup_retention_period
  ts_aws_db_instance_username                = var.hello_world_aws_db_instance_username
}

/* EKS Cluster */

module "hello_ts_aws_eks_cluster" {
  source = "../../modules/eks_cluster"

  ts_aws_eks_cluster_name                    = var.hello_ts_aws_eks_cluster_name
  ts_aws_eks_cluster_endpoint_private_access = var.hello_ts_aws_eks_cluster_endpoint_private_access
  ts_aws_eks_cluster_endpoint_public_access  = var.hello_ts_aws_eks_cluster_endpoint_public_access
  ts_aws_eks_cluster_public_access_cidrs     = var.hello_ts_aws_eks_cluster_public_access_cidrs
  ts_aws_eks_cluster_subnet_ids              = values(module.ts_aws_vpc_hello_world.ts_aws_subnet_private_ngw_map)
  ts_aws_eks_node_group_name                 = var.hello_ts_aws_eks_node_group_name
  ts_aws_eks_node_group_instance_types       = var.hello_ts_aws_eks_node_group_instance_types
  ts_aws_eks_node_group_desired_size         = var.hello_ts_aws_eks_node_group_desired_size
  ts_aws_eks_node_group_max_size             = var.hello_ts_aws_eks_node_group_max_size
  ts_aws_eks_node_group_min_size             = var.hello_ts_aws_eks_node_group_min_size

}

/* EKS Helm */

module "hello_ts_aws_eks_helm_kubewatch" {
  source = "../../modules/eks_helm"

  ts_aws_eks_cluster_name           = module.hello_ts_aws_eks_cluster.ts_aws_eks_cluster_name
  ts_aws_eks_cluster_endpoint       = module.hello_ts_aws_eks_cluster.ts_aws_eks_cluster_endpoint
  ts_aws_eks_cluster_ca_certificate = module.hello_ts_aws_eks_cluster.ts_aws_eks_cluster_certificate_authority_data

  ts_aws_eks_helm_release_name       = var.hello_ts_aws_eks_helm_release_name
  ts_aws_eks_helm_release_repository = var.hello_ts_aws_eks_helm_release_repository
  ts_aws_eks_helm_release_chart      = var.hello_ts_aws_eks_helm_release_chart
  ts_aws_eks_helm_release_values     = [
    templatefile("${path.module}/kubewatch-values.yaml.tftpl", {})
  ]

}