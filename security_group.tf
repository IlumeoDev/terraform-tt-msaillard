resource "aws_security_group" "alb" {
  name        = "Private ALB - Security Group"
  description = "General rules for ALB Interconnexion"
  vpc_id      = data.aws_vpc.shared.id

  egress {
    description      = "Allow egress traffic"
    from_port        = 0
    to_port          = 0
    ### Not a best practice to allow all traffic, try to be as specific as possible
    protocol         = "1" ### allow icmp
    cidr_blocks      = ["1.2.3.4/32"] ### specific addresses
    ### enable ipv6_cidr_blocks = ["::/0"] if necessary
  }

  tags = {
    Name = "Private ALB - Security Group"
  }
}
