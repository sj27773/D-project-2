resource "aws_vpc" "bastion_vpc" {
  cidr_block = "192.168.0.0/16"
}

resource "aws_vpc" "app_vpc" {
  cidr_block = "172.32.0.0/16"
}

resource "aws_subnet" "bastion_public" {
  vpc_id     = aws_vpc.bastion_vpc.id
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "app_public" {
  vpc_id     = aws_vpc.app_vpc.id
  cidr_block = "172.32.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "app_private_a" {
  vpc_id     = aws_vpc.app_vpc.id
  cidr_block = "172.32.2.0/24"
}

resource "aws_subnet" "app_private_b" {
  vpc_id     = aws_vpc.app_vpc.id
  cidr_block = "172.32.3.0/24"
}