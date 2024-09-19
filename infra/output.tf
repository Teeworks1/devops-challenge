output "instance_ip_addr" {
  description = "ip address of the instance"
  value = aws_instance.web.public_ip
}

output "aws_vpc" {
    value = module.vpc.vpc_id
}

output "arn" {
  value =  aws_instance.web.arn
}

output "igw_arn" {
  value = module.vpc.igw_arn 
}

output "azs" {
  value = module.vpc.azs 
}
output "name" {
  value = module.vpc.name
}