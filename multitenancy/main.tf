terraform {
  backend "s3" {
    bucket         = "unique-terraform-state-bucket-hcl-3210"
    key            = "multitenancy/dafault/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "unique-terraform-state-lock-hcl-3210"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0e2c8caa4b6378d8c"  # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"

  tags = {
    Name = "my-app-${terraform.workspace}-instance"  # Unique name per workspace
  }
}
