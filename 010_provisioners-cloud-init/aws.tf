# Use existing key pair on local machine
resource "aws_key_pair" "my_kp" {
  key_name   = "local_keys"
  public_key = file("~/.ssh/id_ed25519.pub")
}


resource "aws_instance" "my_server" {
  ami           = "ami-0157af9aea2eef346"
  instance_type = var.instance_type
  # Use existing key pair in AWS
  #key_name      = "my_key"

  # Use existing key on local machine
  key_name = aws_key_pair.my_kp.key_name

  # If userdata.yaml uses variable, it should be called with templatefile function
  # template_file has been deprecated 
  user_data = file("./userdata.yaml")

  tags = {
    Name = "MyServer-${local.project_name}"
  }

}




/*
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  providers = {
    aws = aws.eu
  }

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
*/


