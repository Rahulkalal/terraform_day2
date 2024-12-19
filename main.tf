# main.tf

# Provider for the S3 bucket (in ap-southeast-2 region)
provider "aws" {
  alias  = "s3"
  region = "ap-southeast-2"
}

# Provider for DynamoDB (in us-east-1 region)
provider "aws" {
  alias  = "dynamodb"
  region = "us-east-1"
}

# Remote Backend Configuration
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-hcl"   # Your S3 bucket name
    key            = "terraform/statefile/terraform.tfstate"   # Path to store the state file in S3
    region         = "ap-southeast-2"                    # Region for the S3 bucket
    encrypt        = true                                # Enable encryption for state file
    versioning     = true                                # Enable versioning for state tracking
    dynamodb_table = "terraform-state-locks"             # DynamoDB table for state locking
  }
}
