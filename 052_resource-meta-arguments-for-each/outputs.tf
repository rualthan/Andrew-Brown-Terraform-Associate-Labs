output "public_ip" {

  # For the first instance
  #value = aws_instance.my_server[0].public_ip

  # For all instances
  # value = aws_instance.my_server[*].public_ip

  value = values(aws_instance.my_server)[*].public_ip
  #values takes a map and returns a list containing the values
  # of the elements in that map.
  # https://developer.hashicorp.com/terraform/language/functions/values
}