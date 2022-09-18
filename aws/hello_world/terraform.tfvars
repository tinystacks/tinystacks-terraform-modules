hello_world_aws_region  = "us-east-1"

hello_world_aws_vpc_cidr_block = "10.0.0.0/16"
hello_world_aws_vpc_cidr_newbits = 4

hello_world_public_igw_cidr_blocks = {
  "us-east-1b" = 1
  "us-east-1d" = 2
  "us-east-1f" = 3
}

hello_world_private_ngw_cidr_blocks = {
  "us-east-1b" = 4
  "us-east-1d" = 5
  "us-east-1f" = 6
}

hello_world_private_airgap_cidr_blocks = {
  "us-east-1b" = 7
  "us-east-1d" = 8
  "us-east-1f" = 9
}

hello_world_vpc_security_group_rules = [
  {
    rule_type   = "ingress"
    description = "Ping"
    from_port   = 0
    to_port     = 0
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    rule_type   = "ingress"
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
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

hello_world_aws_ami_filter_name_values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
hello_world_aws_ami_owners = ["099720109477"]
hello_world_aws_instance_type = "t2.micro"
hello_world_aws_instance_key_name = "tinystacks_terraform_aj"