resource "aws_security_group" "main_sg" {
  name        = "main_sg"
  description = "Allow SSH , HTTP and HTTPS"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  

  tags = {
    Name = "MainSecurityGroup"
  }
}

resource "aws_key_pair" "deployer_key"{
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)

  tags = {
    Name = "DeployerKey"
  }
}
