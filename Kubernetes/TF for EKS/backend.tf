#backend.tf
terraform {
  backend "s3" {
    bucket = "asidiki-terraform"
    region = "us-east-1"
    key = "eks/terraform.tfstate"
  }
}