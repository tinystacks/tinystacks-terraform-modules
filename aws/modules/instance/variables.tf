variable "ts_aws_subnet_id" {
  description = "TinyStacks AWS Subnet ID"
  type        = string
}

variable "ts_vpc_security_group_ids" {
  description = "TinyStacks VPC Security Group IDs"
  type        = list(string)
}

variable "ts_aws_ami_filter_name_values" {
  description = "TinyStacks AWS AMI filter name:values"
  type        = list(string)
  default     = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"] 
}

variable "ts_aws_ami_owners" {
  description = "TinyStacks AWS AMI owners"
  type        = list(string)
  default     = ["099720109477"] 
}

variable "ts_aws_instance_type" {
  description = "TinyStacks AWS Instance type"
  type        = string
  default     = "t2.micro"
}

variable "ts_aws_instance_key_name" {
  description = "TinyStacks AWS Instance Key Name"
  type        = string
}