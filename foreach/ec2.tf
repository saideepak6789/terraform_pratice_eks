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
# Added availability_zone here this is list to set will convert from list to map
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.amazonlinux2.id
  instance_type          = var.instance_type
  user_data              = file("app1-install.sh")
  key_name               = var.aws_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  for_each               = toset(data.aws_availability_zones.my_azones.names) # list to map
  availability_zone      = each.key                                           # it will each different zone
  tags = {
    "Name" = "Instance-${each.value}"
  }
}
