output "ts_aws_db_instance_endpoint" {
  description = "TinyStacks AWS DB Instance endpoint"
  value = aws_db_instance.ts_aws_db_instance.endpoint
}

output "ts_aws_db_instance_username" {
  description = "TinyStacks AWS DB Instance username"
  value = aws_db_instance.ts_aws_db_instance.username
}

output "ts_aws_db_instance_password" {
  description = "TinyStacks AWS DB Instance password"
  value = random_password.ts_aws_db_instance_password.result
}

output "ts_aws_db_instance_db_name" {
  description = "TinyStacks AWS DB Instance DB name"
  value = aws_db_instance.ts_aws_db_instance.db_name
}