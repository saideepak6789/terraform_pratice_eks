# create  a null resource and provisioners
resource "null_resource" "copy_ec2_keys" {
  depends_on = [module.ec2_bastion_public]
  # connection block for the provisioners to connect EC2 instance
  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("sai_own.ppk")
  }
  # local exec provisioner : local-exec provisioner (creation time provisioners)
  provisioner "local-exec" {
    command     = "echo vpc created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-out-files"
  }
}
