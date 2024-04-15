terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.45.0"
    }
  }

  backend "s3" {
    bucket = "cjay-tf-state-bucket"
    key = "tfstate"
    region = "us-east-1"
    
  }
}