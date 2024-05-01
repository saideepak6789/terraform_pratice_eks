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