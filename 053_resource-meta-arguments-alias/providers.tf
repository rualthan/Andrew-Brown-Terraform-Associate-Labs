
provider "aws" {
  # Configuration options
  # profile = "default"
  region = "us-east-1"
  alias  = "east"
}

provider "aws" {
  # Configuration options
  # profile = "default"
  region = "us-west-1"
  alias  = "west"
}