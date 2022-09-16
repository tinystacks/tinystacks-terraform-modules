variable "hello_world_aws_region" {
  description = "Hello world AWS region"
  type        = string
}

variable "hello_world_aws_profile" {
  description = "Hello World AWS profile"
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

/* */

variable "hello_world_aws_subnet_public_igw_cidr_block" {
  description = "Hello World AWS Subnet Public IGW CIDR block"
  type        = string
  default     = "10.0.10.0/24"
}

variable "hello_world_aws_subnet_public_igw_availability_zone" {
  description = "Hello World AWS Subnet Public IGW Availability Zone"
  type        = string
  default     = "us-east-1b"
}

variable "hello_world_aws_subnet_public_igw_tags" {
  description = "Hello World AWS Subnet Public IGW tags"
  type        = map
  default     = {
    "Name" = "ts public igw"
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

variable "hello_world_aws_subnet_private_ngw_cidr_block" {
  description = "Hello World AWS Subnet Private NGW CIDR block"
  type        = string
  default     = "10.0.20.0/24"
}

variable "hello_world_aws_subnet_private_ngw_availability_zone" {
  description = "Hello World AWS Subnet Private NGW Availability Zone"
  type        = string
  default     = "us-east-1d"
}

variable "hello_world_aws_subnet_private_ngw_tags" {
  description = "Hello World AWS Subnet Private NGW tags"
  type        = map
  default     = {
    "Name" = "ts private ngw"
  }
}

variable "hello_world_aws_route_table_private_ngw_tags" {
  description = "Hello World AWS Route Table Private NGW tags"
  type        = map
  default     = {
    "Name" = "ts private ngw"
  }
}

variable "hello_world_aws_nat_gateway_tags" {
  description = "Hello World AWS NAT Gateway tags"
  type        = map
  default     = {
    "Name" = "ts ngw"
  }
}

/* */

variable "hello_world_aws_subnet_private_airgap_cidr_block" {
  description = "Hello World AWS Subnet Private airgap CIDR block"
  type        = string
  default     = "10.0.30.0/24"
}

variable "hello_world_aws_subnet_private_airgap_availability_zone" {
  description = "Hello World AWS Subnet Private airgap Availability Zone"
  type        = string
  default     = "us-east-1f"
}

variable "hello_world_aws_subnet_private_airgap_tags" {
  description = "Hello World AWS Subnet Private airgap tags"
  type        = map
  default     = {
    "Name" = "ts private airgap"
  }
}

variable "hello_world_aws_route_table_private_airgap_tags" {
  description = "Hello World AWS Route Table Private airgap tags"
  type        = map
  default     = {
    "Name" = "ts private airgap"
  }
}