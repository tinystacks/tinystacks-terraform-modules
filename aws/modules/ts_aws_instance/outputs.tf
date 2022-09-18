output "ts_aws_instance_id" {
  description = "TinyStacks AWS Instance ID"
  value       = aws_instance.ts_aws_instance.id
}

output "ts_aws_instance_public_ip" {
  description = "TinyStacks AWS Instance Public IP"
  value       = aws_instance.ts_aws_instance.public_ip
}

output "ts_aws_instance_private_ip" {
  description = "TinyStacks AWS Instance Private IP"
  value       = aws_instance.ts_aws_instance.private_ip
}