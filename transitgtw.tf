resource "aws_ec2_transit_gateway" "tgw" {}

resource "aws_ec2_transit_gateway_vpc_attachment" "bastion_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.bastion_vpc.id
  subnet_ids         = [aws_subnet.bastion_public.id]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "app_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.app_vpc.id
  subnet_ids         = [aws_subnet.app_private_a.id, aws_subnet.app_private_b.id]
}
