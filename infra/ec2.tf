
resource "aws_instance" "web" {
  ami           = "ami-0e86e20dae9224db8"
  key_name =  "deployer-key"
  subnet_id =  element(module.vpc.public_subnets, 0)
  user_data =  "${file("apache_install.sh")}"
  vpc_security_group_ids = [aws_security_group.bastion-instance.id]
  associate_public_ip_address =  true
  instance_type = "t2.micro"

  provisioner "file" {
    source      = ".././k8" 
    destination = "/home/ec2-user/remote-directory" 

    connection {
      type     = "ssh"
      user     = "ec2-user"
      host     = self.public_ip
      private_key = tls_private_key.ed25519-example.private_key_pem
    }
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Files copied!'"
    ]

    connection {
      type     = "ssh"
      user     = "ec2-user"
      host     = self.public_ip
      private_key = tls_private_key.ed25519-example.private_key_pem
    }
  }
  tags = {
    Name = local.name
  }
}