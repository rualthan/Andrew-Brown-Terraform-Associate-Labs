variable "instance_type" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "my_ip_with_cidr" {
  type = string
}

variable "bucket" {
  type = string
}
variable "public_key" {
  type = string
}

variable "server_name" {
  type = string
}


variable "workspace_iam_roles" {
  default = {
    staging    = "arn:aws:iam::STAGING-ACCOUNT-ID:role/Terraform"
    production = "arn:aws:iam::PROD-ACCOUNT-ID:role/Terraform"
  }
}