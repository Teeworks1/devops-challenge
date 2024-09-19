terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=3.29"
    }
  }
}

provider "aws" {
  profile ="default"
  region  = var.aws_region
}

/*
resource "null_resource" "copy_key_pair" {
  depends_on = [ module.bastion-instance, module.ec2_instance ]
  connection {
    type = "ssh"
    host = module.bastion-instance.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("deployerkey") 
  }
 provisioner "file" {
  source = "deployerkey"
  destination = "/tmp/deployerkey"  
 }
 provisioner "remote-exec" {
   inline = [
    "sudo chmod 400 /deployerkey"
   ]
 }
 provisioner "local-exec" {
   command = echo "echo VPC created on 'date' and VPC ID : ${module.vpc.voc_id} >> creation-time-vpc.txt
   working_dir = "local-exec-output-files"
   }
}*/

