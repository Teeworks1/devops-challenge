#! /bin/bash
# curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644
# curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--tls-san your_server_ip" sh -
# sudo apt update -y && sudo apt install docker.io -y
# sudo usermod -aG docker $USER
# newgrp docker


#!/bin/bash

########################################
##### USE THIS WITH AMAZON LINUX 2 #####
########################################

# get admin privileges
sudo su

# install httpd (Linux 2 version)
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World from $(hostname -f)" > /var/www/html/index.html