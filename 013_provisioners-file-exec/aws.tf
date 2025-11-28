resource "aws_key_pair" "my_kp" {
  key_name   = "local_keys"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "my_server" {
  ami           = "ami-0157af9aea2eef346"
  instance_type = var.instance_type
  key_name      = aws_key_pair.my_kp.key_name
  tags = {
    Name = "MyServer-${local.project_name}"
  }

  # connection block can be nested within provisioner block
  # but it will apply to the block only
  # when it is outside of provisioner block, it can be shared
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_ed25519")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "my-config.conf"
    destination = "/home/ec2-user/my-config.conf"
  }

  provisioner "file" {
    content     = "Andrew Brown is a great teach. He is funny as well."
    destination = "/home/ec2-user/andrew.txt"
  }
}



