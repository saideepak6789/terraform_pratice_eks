module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name            = "${local.name}-${var.vpc_name}" #HR-stage-myvpc
  cidr            = var.cidr_block
  azs             = var.vpc_availablity_zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets
  # database
  database_subnets                   = var.vpc_database_subnets
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = true
  #out bound
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway
  #VPC DNS parameters
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_dns_support   = var.vpc_enable_dns_support
  map_public_ip_on_launch =true
  public_subnet_tags = {
    Type = "public-subnets"
  }
  private_subnet_tags = {
    Type = "private-subnets"
  }
  database_subnet_tags = {
    Type = "database-subnets"
  }

  #enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
  vpc_tags = {
    Name = "vpc-dev"
  }
}
