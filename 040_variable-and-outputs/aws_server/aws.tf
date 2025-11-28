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

  # Use existing key
  key_name = aws_key_pair.my_kp.key_name

  tags = {
    Name = "MyServer-${local.project_name}"
  }

}

