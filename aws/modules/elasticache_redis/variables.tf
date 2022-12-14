variable "ec_vpc_id" {
  description = "AWS ElastiCache Redis Replication group VPC id"
  type        = string
}

variable "ec_subnet_ids" {
  description = "AWS ElastiCache Redis Subnet group subnet IDs"
  type        = list(string)
}

variable "ec_vpc_cidr" {
  description = "AWS ElastiCache Redis Replication group VPC cidr"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ec_security_group_ids" {
  description = "AWS ElastiCache Redis Replication group security group IDs"
  type        = list(string)
  default     = []
}

variable "ec_id" {
  description = "AWS ElastiCache Redis Replication group id"
  type        = string
  default     = "ts-redis-cluster"
}

variable "ec_description" {
  description = "AWS ElastiCache Redis Replication group description"
  type        = string
  default     = "Redis Cluster"
}

variable "ec_node_type" {
  description = "AWS ElastiCache Redis Replication group node type"
  type        = string
  default     = "cache.m4.large"
}

variable "ec_port" {
  description = "AWS ElastiCache Redis Replication group port"
  type        = number
  default     = 6379
}

variable "ec_parameter_group_name" {
  description = "AWS ElastiCache Redis Replication group parameter group name"
  type        = string
  default     = "default.redis7.cluster.on"
}

variable "ec_snapshot_retention_limit" {
  description = "AWS ElastiCache Redis Replication group snapshot retention limit"
  type        = number
  default     = 5
}

variable "ec_snapshot_window" {
  description = "AWS ElastiCache Redis Replication group snapshot window"
  type        = string
  default     = "00:00-05:00"
}

variable "ec_replicas_per_node_group" {
  description = "AWS ElastiCache Redis Replication group replicas per node group"
  type        = number
  default     = 1
}

variable "ec_num_node_groups" {
  description = "AWS ElastiCache Redis Replication group num node groups"
  type        = number
  default     = 3
}