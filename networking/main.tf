terraform {
  backend "s3" {
    bucket         = "unique-terraform-state-bucket-hcl-3210"
    key            = "networking/terraform.tfstate"  # Separate path for networking
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "unique-terraform-state-lock-hcl-3210"
    acl            = "private"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

