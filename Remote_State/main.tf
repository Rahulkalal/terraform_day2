provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tf-state-123" {
  bucket        = "my-terraform-state-bucket-hcl-handson"
  acl           = "private"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "tf_state_lock" {
  name         = "terraform-state-lock-hcl"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
