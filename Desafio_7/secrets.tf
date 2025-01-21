provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Terraform secrets encryption
terraform {
  sensitive_variable_handling = true
}
