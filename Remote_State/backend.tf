terraform {
  backend "s3" {
    bucket         = "my-test-bucket-hcl"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
  }
}
