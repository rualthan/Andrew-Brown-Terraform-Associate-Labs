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

# Dump logs to screen
# TF_LOG=TRACE terraform apply

# Save to file
# TF_LOG=TRACE  TF_LOG_PATH=./tf.log terraform apply

# Dump only provider logs
# TF_LOG_PROVIDER=TRACE  TF_LOG_PATH=./tf.log terraform apply

# Dump only core logs
# TF_LOG_CORE=TRACE  TF_LOG_PATH=./tf.log terraform apply