   resource "aws_instance" "bastion_host" {
  ami                         = "ami-0866a3c8686eaeeba"
  security_groups             = [aws_security_group.baston-sg.name]
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.bastion_public.id
  associate_public_ip_address = true
}
