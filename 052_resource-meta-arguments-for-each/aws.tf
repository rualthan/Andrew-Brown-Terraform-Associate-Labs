resource "aws_instance" "my_server" {
  ami = "ami-0157af9aea2eef346"

  # The for_each argument accepts an expression that must evaluate to one of the following:
  # 1. A map of strings
  # 2. A set of strings
  for_each = {
    nano  = "t2.nano"
    micro = "t2.micro"
    small = "t2.small"
  }

  # The resource or module block is instantiated once for each item in the given collection.  
  instance_type = each.value

  # Add tag name = Server-#
  tags = {
    Name = "Server-${each.key}"
  }
}


