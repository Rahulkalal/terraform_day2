provider "aws" {
  region = "ap-southeast-2"  # AWS region for both S3 and DynamoDB
}

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-hcl"        # Your S3 bucket name
    key            = "terraform/statefile/terraform.tfstate"   # Path to store the state file in S3
    region         = "ap-southeast-2"                    # AWS region for state storage
    encrypt        = true                                  # Enable encryption for state file
    dynamodb_table = "terraform-state-locks-hcl"              # DynamoDB table for state locking
  }
}
