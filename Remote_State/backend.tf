terraform {
  backend "s3" {
    bucket         = "unique-terraform-state-bucket-hcl-12345"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
  }
}
