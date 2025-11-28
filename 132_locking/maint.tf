terraform {
  cloud {

    organization = "br2"

    workspaces {
      name = "forced-unlocking"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "apache" {
  source          = "rualthan/apache-example2/aws"
  version         = "1.0.0"
  public_key      = var.public_key
  vpc_id          = var.vpc_id
  instance_type   = var.instance_type
  my_ip_with_cidr = var.my_ip_with_cidr
  server_name     = var.server_name
}
output "public_ip" {
  value = module.apache.public_ip
}