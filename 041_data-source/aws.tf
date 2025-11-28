# Use existing key pair on local machine
resource "aws_key_pair" "my_kp" {
  key_name   = "local_keys"
  public_key = file("~/.ssh/id_ed25519.pub")
}

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "my_server" {
  #ami           = "ami-0157af9aea2eef346"
  # Rather than hard coding, we will use the AMI
  # fetched using data block

  ami = data.aws_ami.ubuntu_ami.id
  instance_type = var.instance_type

  # Use existing key pair in AWS
  #key_name      = "my_key"

  # Use existing key from local machine
  key_name = aws_key_pair.my_kp.key_name

  tags = {
    Name = "MyServer-${local.project_name}"
  }

}

