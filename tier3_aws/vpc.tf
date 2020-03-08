resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "3 tier VPC"
  }
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = "aws_vpc.my_vpc.id"
}

resource "aws_subnet" "pub_sub" {
  vpc_id = "aws_vpc.my_vpc.id"
  cidr_block = "var.pub_cidr"
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "pri_sub" {
  vpc_id = "aws_vpc.my_vpc.id"
  cidr_block = "var.pri_cidr"
  tags = {
    Name = "private_subnet"
  }
}
resource "aws_default_route_table" "default" {
  default_route_table_id = "aws_vpc.my_vpc.default_route_table.id"

  route {
  cidr_block = "0.0.0.0/0"
  gateway_id = "aws_internet_gateway.internet_gw.id"
  }
}
