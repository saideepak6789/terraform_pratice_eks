variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1"
}
variable "environment" {
  description = "environment variable used as a prefix"
  type        = string
  default     = "dev"
}
variable "business_division" {
  description = "Business division in the large organization"
  type        = string
  default     = "SAP"
}
variable "vpc_name" {
  description = "vpc name"
  type        = string
  default     = "my-vpc"
}
variable "cidr_block" {
  description = "cidr of the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
/*
variable "vpc_availablity_zones" {
  description = "az zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}
*/
variable "vpc_private_subnets" {
  description = "private subnets vpc"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "vpc_public_subnets" {
  description = "public subnets vpc"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}
variable "vpc_database_subnets" {
  description = "database subnets vpc"
  type        = list(string)
  default     = ["10.0.151.0/24", "10.0.152.0/24"]
}
variable "vpc_enable_nat_gateway" {
  default = true
}
variable "vpc_single_nat_gateway" {
  default = true

}
variable "vpc_enable_dns_hostnames" {
  default = true
}
variable "vpc_enable_dns_support" {
  default = true
}
variable "instance_type" {
  default = "t2.micro"

}
variable "aws-keypair1" {
  description = "keypair"
  type        = string
  default     = "sai_own"
}
variable "cluster_name" {
  description = "Eks cluster name"
  type        = string
  default     = "eksdemo"

}