variable "instance_type" {
  type        = string
  description = "This is the size of the instance"
  default = "t2.2xlarge"
}

#Order of precedence
# default in the variable block (t2.2xlarge)
# export TF_VAR_instance_type=t2.large
# terraform.tfvars (t2.medium)
# terraform.tfvars.json (t2.small)
# instance_type.auto.tfvars (t2.micro)
# -var-file=instance_type.tfvars (t2.nano)
# -var=instance_type=t1.small

