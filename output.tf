/*
#normal output
output "instance_public_ip" {
  description = "ec2 public ip"
  value       = aws_instance.ec2.public_ip
}

output "instance_public_DNS" {
  description = "ec2 public ip"
  value       = aws_instance.ec2.public_dns
}
*/

# if we use count then only need to output in loops
# output for loop with list
/* 
output "for_output_list" {
  description = "for loop with list"
  value = [for instance in aws_instance.ec2: instance.public_dns]
}
*/

# output for loop with map
/*
output "for_output_list" {
  description = "for loop with list"
  value = {for instance in aws_instance.ec2: instance.id => instance.public_dns}
}
*/

#output for Loop with Map Advanced
/*
output "for_output_map2" {
  description = "for loop with map adavnced"
  value = {for c, instance in aws_aws_instance.ec2: c => instance.public_dns }
}

*/

#output Legacy splat Operator (Legacy) - Returms list  -- depcrating soon
/*
output "Legacy_splat_instance_publicdns" {
  value = aws_instance.ec2.*.public_dns
}
*/
# Output Latest Generalized splat Operator - Return the List

output "Legacy_Generalized_splat_instance_publicdns" {
  value = aws_instance.ec2[*].public_dns
}