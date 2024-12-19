terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-hcl"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
  }
}
