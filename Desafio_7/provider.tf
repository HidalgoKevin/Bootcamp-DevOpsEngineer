terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }  
  backend "s3" {
    bucket = var.bucket_name
    region = var.region
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = "Desarrollo"
      Name        = "Educacion IT"
    }
  }
}