output "instance_public_ip" {
  description = "ec2 public ip"
  value       = aws_instance.ec2.public_ip
}

output "instance_public_DNS" {
  description = "ec2 public ip"
  value       = aws_instance.ec2.public_dns
}