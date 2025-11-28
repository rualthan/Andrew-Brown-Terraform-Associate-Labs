resource "aws_instance" "my_server" {
  ami           = "ami-0157af9aea2eef346"
  instance_type = var.instance_type
  tags = {
    Name = "MyServer-${local.project_name}"
  }

}
