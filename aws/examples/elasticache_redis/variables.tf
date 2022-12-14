/* */

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

variable "hello_world_slice_azs" {
    type = bool
    default = true
}

variable "hello_world_slice_start_index" {
    type = number
    default = 0
}

variable "hello_world_slice_end_index" {
    type = number
    default = 3
}

/* */

variable "hello_world_vpc_security_group_rules" {
  description = "Hello World VPC Security Group rules"

  type = list(object({
    rule_type   = string
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      rule_type   = "ingress"
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      rule_type   = "ingress"
      description = "Ping"
      from_port   = 0
      to_port     = 0
      protocol    = "ICMP"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      rule_type   = "egress"
      description = "Outbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

/* Instance */

variable "hello_world_aws_ami_filter_name_values" {
  description = "Hello World AWS AMI filter name:values"
  type        = list(string)
  default     = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"] 
}

variable "hello_world_aws_ami_owners" {
  description = "Hello World AWS AMI owners"
  type        = list(string)
  default     = ["099720109477"] 
}

variable "hello_world_aws_instance_type" {
  description = "Hello World AWS Instance type"
  type        = string
  default     = "t2.micro"
}

variable "hello_world_aws_instance_key_name" {
  description = "Hello World AWS Instance Key Name"
  type        = string
  default     = "ts_aj_terraform"
}

/* Redis */

variable "hw_id" {
  description = "AWS ElastiCache Redis Replication group id"
  type        = string
  default     = "hello-world-redis-cluster"
}

variable "hw_description" {
  description = "AWS ElastiCache Redis Replication group description"
  type        = string
  default     = "Redis Cluster"
}

variable "hw_node_type" {
  description = "AWS ElastiCache Redis Replication group node type"
  type        = string
  default     = "cache.m4.large"
}

variable "hw_port" {
  description = "AWS ElastiCache Redis Replication group port"
  type        = number
  default     = 6379
}

variable "hw_parameter_group_name" {
  description = "AWS ElastiCache Redis Replication group parameter group name"
  type        = string
  default     = "default.redis7.cluster.on"
}

variable "hw_snapshot_retention_limit" {
  description = "AWS ElastiCache Redis Replication group snapshot retention limit"
  type        = number
  default     = 5
}

variable "hw_snapshot_window" {
  description = "AWS ElastiCache Redis Replication group snapshot window"
  type        = string
  default     = "00:00-05:00"
}

variable "hw_replicas_per_node_group" {
  description = "AWS ElastiCache Redis Replication group replicas per node group"
  type        = number
  default     = 1
}

variable "hw_num_node_groups" {
  description = "AWS ElastiCache Redis Replication group num node groups"
  type        = number
  default     = 3
}
