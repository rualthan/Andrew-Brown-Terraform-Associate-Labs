module "aws_server" {
  source = "./aws_server"
}

output "public_ip" {
  description = "The public IP of the instance"
  value       = module.aws_server.public_ip
}