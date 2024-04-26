terraform {
  # Configure the S3 backend
  backend "s3" {
    #bucket = "terraform.s3.22-04-24"
    #key    = "tfstate/statefile.tf"
    #region = "ap-south-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version    = "~> 2.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

