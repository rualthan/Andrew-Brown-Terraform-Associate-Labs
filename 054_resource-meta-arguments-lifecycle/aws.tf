resource "aws_instance" "my_server" {
  ami           = "ami-0cae6d6fe6048ca2c"
  instance_type = var.instance_type

  tags = {
    Name = "MyServer-${local.project_name}"
  }

  # lifecycle block is used to alter the default lifecycle
  lifecycle {
    # Prevents the resource from destroy
    # if set to true, false is default
    prevent_destroy = false

    # If the resource cannot be modified in place
    # it will create a new one before destroying the existing
    # The default is destroy and create
    #create_before_destroy = true
  }

}
