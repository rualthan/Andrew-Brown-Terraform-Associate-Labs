output "public_ip" {
  description = "This is the public IP of the instance"
  value       = aws_instance.my_server.public_ip
  #sensitive = true
}