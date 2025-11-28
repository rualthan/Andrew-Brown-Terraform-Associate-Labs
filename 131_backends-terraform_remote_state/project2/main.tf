
data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../project1/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}


module "apache" {

  #source     = "../../110_modules/terraform-aws-apache-example"
  source = "rualthan/apache-example2/aws"
  version    = "1.0.0"
  public_key = var.public_key
  # We are fetching vpc_id from the output of a different module
  vpc_id   = data.terraform_remote_state.vpc.outputs.vpc_id
  instance_type   = var.instance_type
  my_ip_with_cidr = var.my_ip_with_cidr
  server_name     = var.server_name
}
output "public_ip" {
  value = module.apache.public_ip
}