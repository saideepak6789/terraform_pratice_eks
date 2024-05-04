#Security group
module "public_bastion_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "${local.name}-public-bastion-sg"
  description = "Security group for SSH port opened publicly egree ports are all opened"
  vpc_id      = module.vpc.vpc_id
  #ingress rules and CIDR
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  #egress_rule
  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]
  tags               = local.common_tags
}

# data for the ami
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

output "ami_id" {
  value = data.aws_ami.amazonlinux2.id
}

module "ec2_bastion_public" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  name                   = "${local.name}-instance"
  instance_type          = var.instance_type
  ami                    = data.aws_ami.amazonlinux2.id
  key_name               = var.aws-keypair1
  monitoring             = true
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]
  tags                   = local.common_tags
}

resource "aws_eip" "bastion_eip" {
  instance   = module.ec2_bastion_public.id
  tags       = local.common_tags
  depends_on = [module.ec2_bastion_public, module.vpc]
}
