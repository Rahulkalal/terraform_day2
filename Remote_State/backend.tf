terraform {
  backend "s3" {
    bucket         = "unique-terraform-state-bucket-hcl-3210"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "unique-terraform-state-lock-hcl-3210"
    encrypt        = true
  }
}
