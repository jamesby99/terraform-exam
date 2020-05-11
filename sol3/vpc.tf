# Declare the data source
data "aws_availability_zones" "available" {
  state    = "available"
}

locals {
  zone_length = length(data.aws_availability_zones.available.names)
}

# Internet VPC
resource "aws_vpc" "kiunsen-vpc" {
  cidr_block           = "10.10.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "kiunsen-vpc"
  }
}

# Public Subnets
resource "aws_subnet" "kiunsen-public" {
  vpc_id                  = aws_vpc.kiunsen-vpc.id
  count                   = var.PUBLIC_SUBNET_NUMBERS
  cidr_block              = cidrsubnet(aws_vpc.kiunsen-vpc.cidr_block, 8, count.index+1)
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[(count.index%local.zone_length)]

  tags = {
    Name = "kiunsen-public"
  }
}

# Private Subnets
resource "aws_subnet" "kiunsen-private" {
  vpc_id                  = aws_vpc.kiunsen-vpc.id
  count                   = var.PRIVATE_SUBNET_NUMBERS
  cidr_block              = cidrsubnet(aws_vpc.kiunsen-vpc.cidr_block, 8, count.index+var.PUBLIC_SUBNET_NUMBERS+1)
  map_public_ip_on_launch = "false"
  availability_zone       = data.aws_availability_zones.available.names[(count.index%local.zone_length)]

  tags = {
    Name = "kiunsen-private"
  }
}

# Internet GW
resource "aws_internet_gateway" "kiunsen-gw" {
  vpc_id = aws_vpc.kiunsen-vpc.id

  tags = {
    Name = "kiunsen-gw"
  }
}

# route tables
resource "aws_route_table" "kiunsen-public-route" {
  vpc_id = aws_vpc.kiunsen-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kiunsen-gw.id
  }

  tags = {
    Name = "kiunsen-public-route"
  }
}

# route associations public
resource "aws_route_table_association" "kiunsen-public" {
  count          = length(aws_subnet.kiunsen-public)
  subnet_id      = aws_subnet.kiunsen-public[count.index].id
  route_table_id = aws_route_table.kiunsen-public-route.id
}
