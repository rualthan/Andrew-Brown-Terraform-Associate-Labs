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

# terraform apply -replace=aws_instance.my_server
resource "aws_instance" "my_server" {
  ami           = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"
  tags = {
    Name = "MyServer"
  }
}

# Import with:
# terraform import aws_s3_bucket.bucket br-bucket-13232234211231
# Now, it will show up in terraform state list
resource "aws_s3_bucket" "bucket" {
  bucket = "br-bucket-13232234211231"
}

output "public_ip" {
  value = aws_instance.my_server.public_ip
}