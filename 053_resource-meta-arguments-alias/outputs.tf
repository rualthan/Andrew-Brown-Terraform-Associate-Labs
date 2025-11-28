output "public_ip_east" {
  description = "This is the public IP of the instance"
  value       = aws_instance.my_east_server.public_dns
}


output "public_ip_west" {
  description = "This is the public IP of the instance"
  value       = aws_instance.my_west_server.public_dns
}