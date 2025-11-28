terraform {
}

provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

module "apache" {
  source          = ".//terraform-aws-apache-example"
  public_key      = file("~/.ssh/id_ed25519.pub")
  vpc_id          = data.aws_vpc.default.id
  instance_type   = "t2.micro"
  my_ip_with_cidr = "101.0.63.143/32"
  server_name     = "Apache Example Server"
}

output "public_ip" {
  value = module.apache.public_ip
}
