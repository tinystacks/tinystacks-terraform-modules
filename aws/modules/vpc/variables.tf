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

variable "ts_vpc_slice_azs" {
    type = bool
    default = true
}

variable "ts_vpc_slice_azs_start_index" {
    type = number
    default = 0
}

variable "ts_vpc_slice_azs_end_index" {
    type = number
    default = 3
}