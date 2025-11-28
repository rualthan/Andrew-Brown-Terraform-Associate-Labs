terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.21.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
resource "aws_instance" "my_server" {
  ami           = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"
  tags = {
    Name = "MyServer"
  }
}

output "public_ip" {
  value = aws_instance.my_server.public_ip
}

# Save a plan
# Command: terraform plan -out=my_saved_plan.plan
# my_saved_plan.plan is in binary format
# Apply saved plan
# Command: terraform apply my_saved_plan.plan 
# It will proceed without prompting
# It can useful for automation such as calling
# terraform from an external script


/*
file my_saved_plan.plan 
my_saved_plan.plan: Zip archive data, at least v2.0 to extract, compression method=deflate
*/