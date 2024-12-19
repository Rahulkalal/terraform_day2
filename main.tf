# main.tf

provider "aws" {
  region = "ap-southeast-2"  # Use the region where both your S3 bucket and DynamoDB table are located
}

# Remote Backend Configuration
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"  # Your S3 bucket name
    key            = "terraform/statefile/terraform.tfstate"  # Path to store the state file in S3
    region         = "ap-southeast-2"  # Region where your S3 bucket and DynamoDB table are located
    encrypt        = true  # Enable encryption for the state file
    versioning     = true  # Enable versioning for state tracking
    dynamodb_table = "terraform-state-locks-hcl"  # DynamoDB table for state locking
  }
}
