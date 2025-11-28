terraform {
  backend "s3" {
    bucket = "tf-remote-state-br"
    key    = "terrafomr.tfstate"
    region = "us-east-1"
    dynamodb_table = "force-unlock-terraform"
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
}

module "apache" {
  source          = "rualthan/apache-example2/aws"
  version         = "1.0.0"
  public_key      = var.public_key
  vpc_id   = var.vpc_id
  instance_type   = var.instance_type
  my_ip_with_cidr = var.my_ip_with_cidr
  server_name     = var.server_name
}
output "public_ip" {
  value = module.apache.public_ip
}
