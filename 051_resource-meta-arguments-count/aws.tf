resource "aws_instance" "my_server" {
  ami           = "ami-0157af9aea2eef346"
  instance_type = var.instance_type
  #Create two instances with the same config
  count = 2

  # Add tag name = Server-#
  tags = {
    Name = "Server-${count.index}"
  }
}


