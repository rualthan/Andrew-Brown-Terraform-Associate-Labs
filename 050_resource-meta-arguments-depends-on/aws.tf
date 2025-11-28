resource "aws_instance" "my_server" {
  ami           = "ami-0157af9aea2eef346"
  instance_type = var.instance_type

  # Instance will be created only after bucket creation
  # This creates explicit dependency.
  # Without this, there is no implicit dependency here
  # since there is no reference to aws_s3_bucket.bucket1 from this this block
  depends_on = [
    aws_s3_bucket.bucket1
  ]
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "124123235252-depends-on"
}
