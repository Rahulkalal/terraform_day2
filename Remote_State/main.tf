provider "aws" {
  region = "us-east-1"
}

# S3 Bucket for Terraform state
resource "aws_s3_bucket" "tf-state-123" {
  bucket        = "unique-terraform-state-bucket-hcl-12345"
  acl           = "private"

  versioning {
    enabled = true
  }
}

# S3 Bucket Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_sse" {
  bucket = aws_s3_bucket.tf-state-123.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# DynamoDB table for state locking
resource "aws_dynamodb_table" "tf_state_lock" {
  name         = "unique-terraform-state-lock-hcl-12345"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
