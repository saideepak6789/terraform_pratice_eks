
output "instance_publicdns" {
  value = [for instance in aws_instance.ec2 : instance.public_ip]
  #or
  #value =toset([for instance in aws_instance.ec2: instance.public_ip])
}

output "instance_publicip" {
  value = [for instance in aws_instance.ec2 : instance.public_dns]
  #or
  #value =toset([for instance in aws_instance.ec2: instance.public_dns])
}


output "instance_publicdns2" {
  value = { for az, instance in aws_instance.ec2 : az => instance.public_ip }
}