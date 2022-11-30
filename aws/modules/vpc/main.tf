data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "ts_aws_vpc" {

  cidr_block           = var.ts_aws_vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true

}

locals {

    available_azs = var.ts_vpc_slice_azs ? slice(data.aws_availability_zones.available.names, var.ts_vpc_slice_azs_start_index, var.ts_vpc_slice_azs_end_index) : data.aws_availability_zones.available.names

    az_len = length(local.available_azs)

    ts_public_igw_cidr_blocks = {
        for i in range(0, local.az_len) :
            data.aws_availability_zones.available.names[i] => (local.az_len * 0) + 1 + i
    }

    ts_private_ngw_cidr_blocks = {
        for i in range(0, local.az_len) :
            data.aws_availability_zones.available.names[i] => (local.az_len * 1) + 1 + i
    }

    ts_private_isolated_cidr_blocks = {
        for i in range(0, local.az_len) :
            data.aws_availability_zones.available.names[i] => (local.az_len * 2) + 1 + i
    }

}

/* */

resource "aws_subnet" "ts_aws_subnet_public_igw" {

  for_each = local.ts_public_igw_cidr_blocks

  vpc_id            = aws_vpc.ts_aws_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.ts_aws_vpc.cidr_block, var.ts_aws_vpc_cidr_newbits, each.value)
  availability_zone = each.key

  map_public_ip_on_launch = true
}

resource "aws_route_table" "ts_aws_route_table_public_igw" {

  vpc_id = aws_vpc.ts_aws_vpc.id

}

resource "aws_route_table_association" "ts_aws_route_table_association_public_igw" {

  for_each       = aws_subnet.ts_aws_subnet_public_igw

  subnet_id      = each.value.id
  route_table_id = aws_route_table.ts_aws_route_table_public_igw.id
}

resource "aws_internet_gateway" "ts_aws_internet_gateway" {

  vpc_id = aws_vpc.ts_aws_vpc.id

}

resource "aws_route" "ts_aws_route_public_igw" {
  route_table_id         = aws_route_table.ts_aws_route_table_public_igw.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ts_aws_internet_gateway.id
}

/* */

resource "aws_subnet" "ts_aws_subnet_private_ngw" {

  for_each = local.ts_private_ngw_cidr_blocks

  vpc_id            = aws_vpc.ts_aws_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.ts_aws_vpc.cidr_block, var.ts_aws_vpc_cidr_newbits, each.value)
  availability_zone = each.key
}

resource "aws_route_table" "ts_aws_route_table_private_ngw" {

  for_each = local.ts_private_ngw_cidr_blocks

  vpc_id = aws_vpc.ts_aws_vpc.id
}

resource "aws_route_table_association" "ts_aws_route_table_association_private_ngw" {

  for_each = local.ts_private_ngw_cidr_blocks

  subnet_id      = aws_subnet.ts_aws_subnet_private_ngw[each.key].id
  route_table_id = aws_route_table.ts_aws_route_table_private_ngw[each.key].id
}

resource "aws_eip" "ts_aws_eip_nat" {

  for_each = local.ts_private_ngw_cidr_blocks

  vpc = true
}

resource "aws_nat_gateway" "ts_aws_nat_gateway" {

  for_each = local.ts_private_ngw_cidr_blocks

  subnet_id     = aws_subnet.ts_aws_subnet_public_igw[each.key].id
  allocation_id = aws_eip.ts_aws_eip_nat[each.key].id

  depends_on    = [aws_internet_gateway.ts_aws_internet_gateway]
}

resource "aws_route" "ts_aws_route_private_ngw" {

  for_each = local.ts_private_ngw_cidr_blocks

  route_table_id         = aws_route_table.ts_aws_route_table_private_ngw[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ts_aws_nat_gateway[each.key].id
}

/* */

resource "aws_subnet" "ts_aws_subnet_private_isolated" {

  for_each = local.ts_private_isolated_cidr_blocks

  vpc_id            = aws_vpc.ts_aws_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.ts_aws_vpc.cidr_block, var.ts_aws_vpc_cidr_newbits, each.value)
  availability_zone = each.key
}

resource "aws_route_table" "ts_aws_route_table_private_isolated" {

  vpc_id = aws_vpc.ts_aws_vpc.id

}

resource "aws_route_table_association" "ts_aws_route_table_association_private_isolated" {

  for_each = aws_subnet.ts_aws_subnet_private_isolated

  subnet_id      = each.value.id
  route_table_id = aws_route_table.ts_aws_route_table_private_isolated.id
}