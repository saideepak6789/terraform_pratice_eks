variable "aws_region" {
  description = "region in which aws resources created"
  default     = "us-east-1"
  type        = string
}

variable "instance_type" {
  description = "ec2 instace type"
  type        = string
  default     = "t2.micro"
}

variable "aws_keypair" {
  description = "keypair"
  type        = string
  default     = "sai_own"
}

variable "instance_type_list" {
  description = "ec2 instance type list"
  type        = list(string)
  default     = ["t2.micro", "t3.small", "t3.large"]
  #          [0,             1,        2] 
}

variable "instance_type_map" {
  description = "ec2 instance type map"
  type        = map(string)
  default = {
    "dev"  = "t2.micro"
    "qa"   = "t3.small"
    "prod" = "t3.large"
  }
}