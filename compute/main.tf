terraform {
  backend "s3" {
    bucket         = "unique-terraform-state-bucket-hcl-3210"
    key            = "compute/terraform.tfstate"  # Separate path for compute
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "unique-terraform-state-lock-hcl-3210"
    acl            = "private"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0e2c8caa4b6378d8c"  # Example AMI
  instance_type = "t2.micro"
}

