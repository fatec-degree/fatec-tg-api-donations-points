resource "aws_vpc" "api_donations_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name" = "api-donations-vpc"
  }
}

resource "aws_subnet" "api_donations_subnet" {
  vpc_id                  = aws_vpc.api_donations_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "api-donations-subnet"
  }
}

resource "aws_subnet" "api_donations_db_subnet_1" {
  vpc_id                  = aws_vpc.api_donations_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "api-donations-db-subnet-1"
  }
}

resource "aws_subnet" "api_donations_db_subnet_2" {
  vpc_id                  = aws_vpc.api_donations_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "api-donations-db-subnet-2"
  }
}

resource "aws_internet_gateway" "api_donations_gw" {
  vpc_id = aws_vpc.api_donations_vpc.id

  tags = {
    "Name" = "api-donations-gw"
  }
}

resource "aws_route_table" "api_donations_rtb_pub" {
  vpc_id = aws_vpc.api_donations_vpc.id

  tags = {
    "Name" = "api-donations-rtb-pub"
  }
}

resource "aws_route" "api_donations_rtb" {
  route_table_id         = aws_route_table.api_donations_rtb_pub.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.api_donations_gw.id
}

resource "aws_route_table_association" "api_donations_rtba_pub" {
  route_table_id = aws_route_table.api_donations_rtb_pub.id
  subnet_id      = aws_subnet.api_donations_subnet.id
}

