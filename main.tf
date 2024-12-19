# main.tf

provider "aws" {
  region = "us-east-1"  # Use your desired AWS region
}

# Remote Backend Configuration
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-hcl"   # Your S3 bucket name
    key            = "terraform/statefile/terraform.tfstate"   # Path to store the state file in S3
    region         = "us-east-1"                    # AWS region for the state storage
    encrypt        = true                           # Enable encryption for state file
    dynamodb_table = "terraform-state-locks"        # DynamoDB table for state locking
    versioning     = true                           # Enable versioning to track state changes
  }
}
i
