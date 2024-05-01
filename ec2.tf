resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.amazonlinux2.id
  instance_type          = var.instance_type
  user_data              = file("app1-install.sh")
  key_name               = var.aws_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "Instance-1"
  }
}

data "aws_ami" "amazonlinux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.20240429.0-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}