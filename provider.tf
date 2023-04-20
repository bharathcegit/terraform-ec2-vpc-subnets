provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    key            = "project/demo/terraform.tfstate"
    region         = "us-east-1"
    bucket         = "bharath-us-east-1-tfstate"
    encrypt        = true
  }
}

