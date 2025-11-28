terraform {
  /*
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "br2"

    workspaces {
      name = "getting-started"
    }
  }
  */

  /*
  cloud {
    hostname     = "app.terraform.io"
    organization = "br2"

    workspaces {
      name = "getting-started"
    }
  }
  */


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.20.0"
    }
  }
}


locals {
  # Assign the current working directory to local.project_name
  # This will be a part of the Name tag
  # This is to easily tell which configuration
  # creates the resource from AWS console
  project_name = basename(path.cwd)
}

