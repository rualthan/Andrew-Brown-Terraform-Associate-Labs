# Use existing key pair on local machine
# Key pairs are region specific
# Create key pair for each region, even we use the same key pair
resource "aws_key_pair" "my_east_key" {
  provider   = aws.east
  key_name   = "local_keys"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_key_pair" "my_west_key" {
  provider   = aws.west
  key_name   = "local_keys"
  public_key = file("~/.ssh/id_ed25519.pub")
}

# AMIs too are region specific
# We fetch AMI for each region
data "aws_ami" "east-ubuntu" {
  provider    = aws.east
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  owners = ["099720109477"] # Canonical
}

data "aws_ami" "west-ubuntu" {
  provider    = aws.west
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  owners = ["099720109477"] # Canonical
}

# We specific which resource to use using
# the provider argument in the resource block
resource "aws_instance" "my_east_server" {
  provider      = aws.east
  ami           = data.aws_ami.east-ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.my_east_key.key_name
  tags = {
    Name = "MyServer-East"
  }
}

resource "aws_instance" "my_west_server" {
  provider      = aws.west
  ami           = data.aws_ami.west-ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.my_west_key.key_name
  tags = {
    Name = "MyServer-West"
  }
}

