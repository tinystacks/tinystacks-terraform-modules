variable "hello_world_aws_vpc_cidr_block" {
  description = "Hello World AWS VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "hello_world_aws_vpc_cidr_newbits" {
  description = "Hello World AWS VPC CIDR new bits"
  type        = number
  default     = 4
}

variable "hello_world_slice_azs" {
    type = bool
    default = true
}

variable "hello_world_slice_start_index" {
    type = number
    default = 0
}

variable "hello_world_slice_end_index" {
    type = number
    default = 3
}

/* RDS */

variable "hello_world_aws_db_vpc_security_group_rules" {
  description = "Hello World AWS DB Security Group rules"

  type = list(object({
    rule_type   = string
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      rule_type   = "ingress"
      description = "Postgres"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      rule_type   = "egress"
      description = "Outbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "hello_world_aws_db_instance_identifier_name" {
  description = "Hello World AWS DB Instance idendifier name"
  type        = string
  default     = "hwdb1"
}

variable "hello_world_aws_db_instance_class" {
  description = "Hello World AWS DB Instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "hello_world_aws_db_instance_allocated_storage" {
  description = "Hello World AWS DB Instance allocated storage"
  type        = number
  default     = 10
}

variable "hello_world_aws_db_instance_engine" {
  description = "Hello World AWS DB Instance engine"
  type        = string
  default     = "postgres"
}

variable "hello_world_aws_db_instance_engine_version" {
  description = "Hello World AWS DB Instance engine version"
  type        = string
  default     = "13.7"
}

variable "hello_world_aws_db_instance_port" {
  description = "Hello World AWS DB Instance port"
  type        = number
  default     = 5432
}

variable "hello_world_aws_db_instance_skip_final_snapshot" {
  description = "Hello World AWS DB Instance  skip final snapshot"
  type        = bool
  default     = true
}

variable "hello_world_aws_db_instance_storage_type" {
  description = "Hello World AWS DB Instance storage type"
  type        = string
  default     = "gp2"
}

variable "hello_world_aws_db_instance_storage_encrypted" {
  description = "Hello World AWS DB Instance storage encrypted"
  type        = bool
  default     = true
}

variable "hello_world_aws_db_instance_multi_az" {
  description = "Hello World AWS DB Instance multi az"
  type        = bool
  default     = false
}

variable "hello_world_aws_db_instance_backup_retention_period" {
  description = "Hello World AWS DB Instance backup retention period"
  type        = number
  default     = 7
}

variable "hello_world_aws_db_instance_username" {
  description = "Hello World AWS DB Instance username"
  type        = string
  default     = "hwuser"
}

/* EKS Cluster */

variable "hello_ts_aws_eks_cluster_name" {
  description = "AWS EKS Cluster name"
  type        = string
  default     = "hello_ts_aws_eks_cluster"
}

variable "hello_ts_aws_eks_cluster_endpoint_private_access" {
  description = "AWS EKS Cluster endpoint private access"
  type        = bool
  default     = true
}

variable "hello_ts_aws_eks_cluster_endpoint_public_access" {
  description = "AWS EKS Cluster endpoint public access"
  type        = bool
  default     = true
}

variable "hello_ts_aws_eks_cluster_public_access_cidrs" {
  description = "AWS EKS Cluster public access cidrs"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "hello_ts_aws_eks_node_group_name" {
  description = "AWS EKS Node group name"
  type        = string
  default     = "hello_ts_aws_eks_node_group"
}

variable "hello_ts_aws_eks_node_group_instance_types" {
  description = "AWS EKS Node group instance types"
  type        = list(string)
  default     = ["t3.large"]
}

variable "hello_ts_aws_eks_node_group_desired_size" {
  description = "AWS EKS Node group desired size"
  type        = number
  default     = 3
}

variable "hello_ts_aws_eks_node_group_max_size" {
  description = "AWS EKS Node group max size"
  type        = number
  default     = 5
}

variable "hello_ts_aws_eks_node_group_min_size" {
  description = "AWS EKS Node group min size"
  type        = number
  default     = 1
}

/* EKS Helm */

variable "hello_ts_aws_eks_helm_release_name" {
  description = "AWS EKS Helm release name"
  type        = string
  default     = "kubewatch"
}

variable "hello_ts_aws_eks_helm_release_repository" {
  description = "AWS EKS Helm release repository"
  type        = string
  default     = "https://charts.bitnami.com/bitnami"
}

variable "hello_ts_aws_eks_helm_release_chart" {
  description = "AWS EKS Helm release chart"
  type        = string
  default     = "kubewatch"
}