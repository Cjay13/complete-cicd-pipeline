provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

data "aws-ami" "ubuntu" {
    most_recent = true

    filter {
        name = "name"
        value = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        value = ["hvm"]
    }

    owners = ["099720109477"]
}