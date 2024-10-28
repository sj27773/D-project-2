resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# NAT Gateway
resource "aws_nat_gateway" "my_nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.app_public.id
}

# Route Table for Private Subnet
resource "aws_route_table" "app_private_route_table" {
  vpc_id = aws_vpc.app_vpc.id
}

# Route for NAT Gateway
resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.app_private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.my_nat.id
}