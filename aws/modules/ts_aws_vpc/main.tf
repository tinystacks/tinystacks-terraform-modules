resource "aws_vpc" "ts_aws_vpc" {
  cidr_block           = var.ts_aws_vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = var.ts_aws_vpc_name
  }
}

/* */

resource "aws_subnet" "ts_aws_subnet_public_igw" {
  vpc_id            = aws_vpc.ts_aws_vpc.id
  cidr_block        = var.ts_aws_subnet_public_igw_cidr_block
  availability_zone = var.ts_aws_subnet_public_igw_availability_zone
  tags              = var.ts_aws_subnet_public_igw_tags
}

resource "aws_route_table" "ts_aws_route_table_public_igw" {
  vpc_id = aws_vpc.ts_aws_vpc.id
  tags   = var.ts_aws_route_table_public_igw_tags
}

resource "aws_route_table_association" "ts_aws_route_table_association_public_igw" {
  subnet_id      = aws_subnet.ts_aws_subnet_public_igw.id
  route_table_id = aws_route_table.ts_aws_route_table_public_igw.id
}

resource "aws_internet_gateway" "ts_aws_internet_gateway" {
  vpc_id = aws_vpc.ts_aws_vpc.id
  tags   = var.ts_aws_internet_gateway_tags
}

resource "aws_route" "ts_aws_route_public_igw" {
  route_table_id         = aws_route_table.ts_aws_route_table_public_igw.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ts_aws_internet_gateway.id
}

/* */

resource "aws_subnet" "ts_aws_subnet_private_ngw" {
  vpc_id            = aws_vpc.ts_aws_vpc.id
  cidr_block        = var.ts_aws_subnet_private_ngw_cidr_block
  availability_zone = var.ts_aws_subnet_private_ngw_availability_zone
  tags              = var.ts_aws_subnet_private_ngw_tags
}

resource "aws_route_table" "ts_aws_route_table_private_ngw" {
  vpc_id = aws_vpc.ts_aws_vpc.id
  tags   = var.ts_aws_route_table_private_ngw_tags
}

resource "aws_route_table_association" "ts_aws_route_table_association_private_ngw" {
  subnet_id      = aws_subnet.ts_aws_subnet_private_ngw.id
  route_table_id = aws_route_table.ts_aws_route_table_private_ngw.id
}

resource "aws_eip" "ts_aws_eip_nat" {
  vpc = true
}

resource "aws_nat_gateway" "ts_aws_nat_gateway" {
  subnet_id     = aws_subnet.ts_aws_subnet_public_igw.id
  allocation_id = aws_eip.ts_aws_eip_nat.id
  tags          = var.ts_aws_nat_gateway_tags

  depends_on    = [aws_internet_gateway.ts_aws_internet_gateway]
}

resource "aws_route" "ts_aws_route_private_ngw" {
  route_table_id         = aws_route_table.ts_aws_route_table_private_ngw.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ts_aws_nat_gateway.id
}

/* */

resource "aws_subnet" "ts_aws_subnet_private_airgap" {
  vpc_id            = aws_vpc.ts_aws_vpc.id
  cidr_block        = var.ts_aws_subnet_private_airgap_cidr_block
  availability_zone = var.ts_aws_subnet_private_airgap_availability_zone
  tags              = var.ts_aws_subnet_private_airgap_tags
}

resource "aws_route_table" "ts_aws_route_table_private_airgap" {
  vpc_id = aws_vpc.ts_aws_vpc.id
  tags   = var.ts_aws_route_table_private_airgap_tags
}

resource "aws_route_table_association" "ts_aws_route_table_association_private_airgap" {
  subnet_id      = aws_subnet.ts_aws_subnet_private_airgap.id
  route_table_id = aws_route_table.ts_aws_route_table_private_airgap.id
}

/* */

