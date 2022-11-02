resource "random_password" "ts_aws_db_instance_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_subnet_group" "ts_aws_db_subnet_group" {
  name        = "ts-aws-db-subnet-group"
  description = "TS AWS DB subnet group"
  subnet_ids  = var.ts_aws_db_instance_subnet_ids
}

resource "aws_db_instance" "ts_aws_db_instance" {
  identifier              = var.ts_aws_db_instance_identifier_name
  db_name                 = var.ts_aws_db_instance_identifier_name
  instance_class          = var.ts_aws_db_instance_class
  allocated_storage       = var.ts_aws_db_instance_allocated_storage
  engine                  = var.ts_aws_db_instance_engine
  engine_version          = var.ts_aws_db_instance_engine_version
  port                    = var.ts_aws_db_instance_port
  skip_final_snapshot     = var.ts_aws_db_instance_skip_final_snapshot
  storage_type            = var.ts_aws_db_instance_storage_type
  storage_encrypted       = var.ts_aws_db_instance_storage_encrypted
  multi_az                = var.ts_aws_db_instance_multi_az
  vpc_security_group_ids  = var.ts_aws_db_instance_vpc_security_group_ids
  db_subnet_group_name    = aws_db_subnet_group.ts_aws_db_subnet_group.id
  backup_retention_period = var.ts_aws_db_instance_backup_retention_period
  username                = var.ts_aws_db_instance_username
  password                = random_password.ts_aws_db_instance_password.result
}