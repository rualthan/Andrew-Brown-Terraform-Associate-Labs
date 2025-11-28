output "public_ip" {

  # For the first instance
  value = aws_instance.my_server[0].public_ip

  # For all instances
  # value = aws_instance.my_server[*].public_ip
}