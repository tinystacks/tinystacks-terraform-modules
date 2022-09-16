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

/* */

variable "ts_aws_subnet_public_igw_cidr_block" {
  description = "TinyStacks AWS Subnet Public IGW CIDR block"
  type        = string
  default     = "10.0.10.0/24"
}

variable "ts_aws_subnet_public_igw_availability_zone" {
  description = "TinyStacks AWS Subnet Public IGW Availability Zone"
  type        = string
  default     = "us-east-1b"
}

variable "ts_aws_subnet_public_igw_tags" {
  description = "TinyStacks AWS Subnet Public IGW tags"
  type        = map
  default     = {
    "Name" = "ts public igw"
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

variable "ts_aws_subnet_private_ngw_cidr_block" {
  description = "TinyStacks AWS Subnet Private NGW CIDR block"
  type        = string
  default     = "10.0.20.0/24"
}

variable "ts_aws_subnet_private_ngw_availability_zone" {
  description = "TinyStacks AWS Subnet Private NGW Availability Zone"
  type        = string
  default     = "us-east-1d"
}

variable "ts_aws_subnet_private_ngw_tags" {
  description = "TinyStacks AWS Subnet Private NGW tags"
  type        = map
  default     = {
    "Name" = "ts private ngw"
  }
}

variable "ts_aws_route_table_private_ngw_tags" {
  description = "TinyStacks AWS Route Table Private NGW tags"
  type        = map
  default     = {
    "Name" = "ts private ngw"
  }
}

variable "ts_aws_nat_gateway_tags" {
  description = "TinyStacks AWS NAT Gateway tags"
  type        = map
  default     = {
    "Name" = "ts ngw"
  }
}

/* */

variable "ts_aws_subnet_private_airgap_cidr_block" {
  description = "TinyStacks AWS Subnet Private airgap CIDR block"
  type        = string
  default     = "10.0.30.0/24"
}

variable "ts_aws_subnet_private_airgap_availability_zone" {
  description = "TinyStacks AWS Subnet Private airgap Availability Zone"
  type        = string
  default     = "us-east-1f"
}

variable "ts_aws_subnet_private_airgap_tags" {
  description = "TinyStacks AWS Subnet Private airgap tags"
  type        = map
  default     = {
    "Name" = "ts private airgap"
  }
}

variable "ts_aws_route_table_private_airgap_tags" {
  description = "TinyStacks AWS Route Table Private airgap tags"
  type        = map
  default     = {
    "Name" = "ts private airgap"
  }
}