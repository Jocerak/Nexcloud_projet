provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "project" {
  count                       = var.instance_count
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.main_subnet.id
  private_ip                  = "${var.private_ip_base}.${count.index + 10}"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.main_sg.id]
  key_name                    = var.key_pair_name
  iam_instance_profile        = var.iam_instance_profile_name



  tags = {
    Name = "${var.instance_names[count.index]}"
    #Name = "${var.instance_name_prefix}-${count.index + 1}"
  }
}