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
  

# Starting terraform 1.4, it is recommended to use
# terraform_data instead of null_resource
resource "terraform_data" "status" {
  # Provisioner runs only once when the resource is first created
  # It will run on next apply even with -replace=aws_instance.my_server
  # triggers_replace is used to force a re-run of provision in terraform_data
  # The null_resource equivalent is triggers
  triggers_replace = {
    instance_id = aws_instance.my_server.id 
  }
  provisioner "local-exec" {
    command = "aws ec2 wait instance-status-ok --instance-ids ${aws_instance.my_server.id}"
  }
  depends_on = [ aws_instance.my_server ]
  
}
