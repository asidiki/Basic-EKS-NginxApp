#backend.tf
terraform {
  backend "s3" {
    bucket = "asidiki-terraform"
    region = "us-east-1"
    key = "jenkins-server/terraform.tfstate"
  }
}