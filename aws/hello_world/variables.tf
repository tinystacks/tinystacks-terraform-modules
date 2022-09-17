variable "hello_world_aws_region" {
  description = "Hello world AWS region"
  type        = string
}

/* */

variable "hello_world_aws_vpc_name" {
  description = "Hello World AWS VPC Name"
  type        = string
  default     = "ts_vpc"
}

variable "hello_world_aws_vpc_cidr_block" {
  description = "Hello World AWS VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "hello_world_aws_vpc_cidr_newbits" {
  description = "Hello World AWS VPC CIDR new bits"
  type        = number
  default     = 4
}

/* */

variable "hello_world_public_igw_cidr_blocks" {
  type = map(number)
  description = "Hello World Availability Zone CIDR Mapping for Public IGW subnets"
 
  default = {
    "us-east-1b" = 1
    "us-east-1d" = 2
    "us-east-1f" = 3
  }
}

variable "hello_world_aws_route_table_public_igw_tags" {
  description = "Hello World AWS Route Table Public IGW tags"
  type        = map
  default     = {
    "Name" = "ts public igw"
  }
}

variable "hello_world_aws_internet_gateway_tags" {
  description = "Hello World AWS Internet Gateway tags"
  type        = map
  default     = {
    "Name" = "ts igw"
  }
}

/* */

variable "hello_world_private_ngw_cidr_blocks" {
  type = map(number)
  description = "Hello World Availability Zone CIDR Mapping for Private NGW subnets"
 
  default = {
    "us-east-1b" = 4
    "us-east-1d" = 5
    "us-east-1f" = 6
  }
}

/* */

variable "hello_world_private_airgap_cidr_blocks" {
  type = map(number)
  description = "Hello World Availability Zone CIDR Mapping for Private airgap subnets"
 
  default = {
    "us-east-1b" = 7
    "us-east-1d" = 8
    "us-east-1f" = 9
  }
}

variable "hello_world_aws_route_table_private_airgap_tags" {
  description = "Hello World AWS Route Table Private airgap tags"
  type        = map
  default     = {
    "Name" = "ts private airgap"
  }
}