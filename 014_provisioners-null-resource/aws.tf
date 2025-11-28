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
}

# null_resource is like a regular resource but it does not create
# any resource externally.
# It often use as a wrapper to run a provisioner
# A provisioner can only be nested inside a resource.
# Its primary purpose is to act as a container for provisioners and to 
# leverage the resource lifecycle and dependency graph of Terraform for
# running custom, non-infrastructure-related actions.
# In this example, until the command (status checks) complete, tf apply will not complete 
resource "null_resource" "status" {
  provisioner "local-exec" {
    command = "aws ec2 wait instance-status-ok --instance-ids ${aws_instance.my_server.id}"
  }
  # explicit dependency 
  depends_on = [aws_instance.my_server]
}