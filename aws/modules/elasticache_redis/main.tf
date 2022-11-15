resource "aws_elasticache_subnet_group" "ts_aws_elasticache_subnet_group" {
  name       = "ts-aws-elasticache-redis-subnet-group"
  subnet_ids = var.ts_aws_elasticache_subnet_group_subnet_ids
}

resource "aws_elasticache_replication_group" "ts_aws_elasticache_replication_group" {
  replication_group_id = var.ts_aws_elasticache_replication_group_id
  description          = var.ts_aws_elasticache_replication_group_description

  node_type            = var.ts_aws_elasticache_replication_group_node_type
  port                 = var.ts_aws_elasticache_replication_group_port
  parameter_group_name = var.ts_aws_elasticache_replication_group_parameter_group_name

  snapshot_retention_limit = var.ts_aws_elasticache_replication_group_snapshot_retention_limit
  snapshot_window          = var.ts_aws_elasticache_replication_group_snapshot_window

  subnet_group_name          = aws_elasticache_subnet_group.ts_aws_elasticache_subnet_group.name
  security_group_ids         = var.ts_aws_elasticache_replication_group_security_group_ids
  automatic_failover_enabled = var.ts_aws_elasticache_replication_group_automatic_failover_enabled

  replicas_per_node_group = var.ts_aws_elasticache_replication_group_replicas_per_node_group
  num_node_groups         = var.ts_aws_elasticache_replication_group_num_node_groups

}