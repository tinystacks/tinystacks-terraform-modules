variable "ts_aws_db_instance_vpc_security_group_ids" {
  description = "TinyStacks AWS DB Instance VPC security group IDs"
  type        = list(string)
}

variable "ts_aws_db_instance_subnet_ids" {
  description = "TinyStacks AWS DB Instance Subnet IDs"
  type        = list(string)
}

variable "ts_aws_db_instance_identifier_name" {
  description = "TinyStacks AWS DB Instance idendifier name"
  type        = string
  default     = "tsdb1"
}

variable "ts_aws_db_instance_class" {
  description = "TinyStacks AWS DB Instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "ts_aws_db_instance_allocated_storage" {
  description = "TinyStacks AWS DB Instance allocated storage"
  type        = number
  default     = 10
}

variable "ts_aws_db_instance_engine" {
  description = "TinyStacks AWS DB Instance engine"
  type        = string
  default     = "postgres"
}

variable "ts_aws_db_instance_engine_version" {
  description = "TinyStacks AWS DB Instance engine version"
  type        = string
  default     = "13.7"
}

variable "ts_aws_db_instance_port" {
  description = "TinyStacks AWS DB Instance port"
  type        = number
  default     = 5432
}

variable "ts_aws_db_instance_skip_final_snapshot" {
  description = "TinyStacks AWS DB Instance  skip final snapshot"
  type        = bool
  default     = true
}

variable "ts_aws_db_instance_storage_type" {
  description = "TinyStacks AWS DB Instance storage type"
  type        = string
  default     = "gp2"
}

variable "ts_aws_db_instance_storage_encrypted" {
  description = "TinyStacks AWS DB Instance storage encrypted"
  type        = bool
  default     = true
}

variable "ts_aws_db_instance_multi_az" {
  description = "TinyStacks AWS DB Instance multi az"
  type        = bool
  default     = false
}

variable "ts_aws_db_instance_backup_retention_period" {
  description = "TinyStacks AWS DB Instance backup retention period"
  type        = number
  default     = 7
}

variable "ts_aws_db_instance_username" {
  description = "TinyStacks AWS DB Instance username"
  type        = string
  default     = "tsuser"
}