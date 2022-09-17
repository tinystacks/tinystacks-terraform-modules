variable "ts_aws_vpc_name" {
  description = "TinyStacks AWS VPC Name"
  type        = string
  default     = "ts_vpc"
}

variable "ts_aws_vpc_cidr_block" {
  description = "TinyStacks AWS VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ts_aws_vpc_cidr_newbits" {
  description = "TinyStacks AWS VPC CIDR new bits"
  type        = number
  default     = 4
}

/* */

variable "ts_public_igw_cidr_blocks" {
  type = map(number)
  description = "TinyStacks Availability Zone CIDR Mapping for Public IGW subnets"
 
  default = {
    "us-east-1b" = 1
    "us-east-1d" = 2
    "us-east-1f" = 3
  }
}

variable "ts_aws_route_table_public_igw_tags" {
  description = "TinyStacks AWS Route Table Public IGW tags"
  type        = map
  default     = {
    "Name" = "ts public igw"
  }
}

variable "ts_aws_internet_gateway_tags" {
  description = "TinyStacks AWS Internet Gateway tags"
  type        = map
  default     = {
    "Name" = "ts igw"
  }
}

/* */

variable "ts_private_ngw_cidr_blocks" {
  type = map(number)
  description = "TinyStacks Availability Zone CIDR Mapping for Private NGW subnets"
 
  default = {
    "us-east-1b" = 4
    "us-east-1d" = 5
    "us-east-1f" = 6
  }
}

/* */

variable "ts_private_airgap_cidr_blocks" {
  type = map(number)
  description = "TinyStacks Availability Zone CIDR Mapping for Private airgap subnets"
 
  default = {
    "us-east-1b" = 7
    "us-east-1d" = 8
    "us-east-1f" = 9
  }
}

variable "ts_aws_route_table_private_airgap_tags" {
  description = "TinyStacks AWS Route Table Private airgap tags"
  type        = map
  default     = {
    "Name" = "ts private airgap"
  }
}