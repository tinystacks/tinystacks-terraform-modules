data "aws_ami" "ts_aws_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = var.ts_aws_ami_filter_name_values
  }

  owners = var.ts_aws_ami_owners
}

resource "aws_instance" "ts_aws_instance" {

  ami                    = data.aws_ami.ts_aws_ami.id
  instance_type          = var.ts_aws_instance_type
  subnet_id              = var.ts_aws_subnet_id
  vpc_security_group_ids = var.ts_vpc_security_group_ids
  key_name               = var.ts_aws_instance_key_name

}