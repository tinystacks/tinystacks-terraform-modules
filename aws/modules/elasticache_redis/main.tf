resource "aws_elasticache_subnet_group" "ec_subnet_group" {
  name       = "ts-aws-elasticache-redis-subnet-group"
  subnet_ids = var.ec_subnet_ids
}

module "ec_default_sg" {
  source = "../security_group"

  ts_aws_security_group_vpc_id = var.ec_vpc_id
  ts_aws_security_group_rules  = [
    {
      rule_type   = "ingress"
      description = "Redis"
      from_port   = 6379
      to_port     = 6379
      protocol    = "tcp"
      cidr_blocks = ["${var.ec_vpc_cidr}"]
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

resource "aws_elasticache_replication_group" "ts_ec" {
  replication_group_id = var.ec_id
  description          = var.ec_description

  node_type            = var.ec_node_type
  port                 = var.ec_port
  parameter_group_name = var.ec_parameter_group_name

  snapshot_retention_limit = var.ec_snapshot_retention_limit
  snapshot_window          = var.ec_snapshot_window

  subnet_group_name          = aws_elasticache_subnet_group.ec_subnet_group.name
  security_group_ids         = concat([module.ec_default_sg.ts_aws_security_group_id], var.ec_security_group_ids)

  replicas_per_node_group = var.ec_replicas_per_node_group
  num_node_groups         = var.ec_num_node_groups

  multi_az_enabled = true
  automatic_failover_enabled = true
  at_rest_encryption_enabled = true
  transit_encryption_enabled = true

}