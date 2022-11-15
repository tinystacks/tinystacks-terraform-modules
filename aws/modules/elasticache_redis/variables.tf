variable "ts_aws_elasticache_subnet_group_subnet_ids" {
  description = "AWS ElastiCache Redis Subnet group subnet IDs"
  type        = list(string)
}

variable "ts_aws_elasticache_replication_group_security_group_ids" {
  description = "AWS ElastiCache Redis Replication group security group IDs"
  type        = list(string)
}

variable "ts_aws_elasticache_replication_group_id" {
  description = "AWS ElastiCache Redis Replication group id"
  type        = string
  default     = "ts-redis-cluster"
}

variable "ts_aws_elasticache_replication_group_description" {
  description = "AWS ElastiCache Redis Replication group description"
  type        = string
  default     = "Redis Cluster"
}

variable "ts_aws_elasticache_replication_group_node_type" {
  description = "AWS ElastiCache Redis Replication group node type"
  type        = string
  default     = "cache.m4.large"
}

variable "ts_aws_elasticache_replication_group_port" {
  description = "AWS ElastiCache Redis Replication group port"
  type        = number
  default     = 6379
}

variable "ts_aws_elasticache_replication_group_parameter_group_name" {
  description = "AWS ElastiCache Redis Replication group parameter group name"
  type        = string
  default     = "default.redis7.cluster.on"
}

variable "ts_aws_elasticache_replication_group_snapshot_retention_limit" {
  description = "AWS ElastiCache Redis Replication group snapshot retention limit"
  type        = number
  default     = 5
}

variable "ts_aws_elasticache_replication_group_snapshot_window" {
  description = "AWS ElastiCache Redis Replication group snapshot window"
  type        = string
  default     = "00:00-05:00"
}

variable "ts_aws_elasticache_replication_group_automatic_failover_enabled" {
  description = "AWS ElastiCache Redis Replication group automatic failover enabled"
  type        = bool
  default     = true
}

variable "ts_aws_elasticache_replication_group_replicas_per_node_group" {
  description = "AWS ElastiCache Redis Replication group replicas per node group"
  type        = number
  default     = 1
}

variable "ts_aws_elasticache_replication_group_num_node_groups" {
  description = "AWS ElastiCache Redis Replication group num node groups"
  type        = number
  default     = 3
}