terraform {
  # Configure the S3 backend
  backend "s3" {
    bucket = "terraform.s3.22-04-24"
    key    = "tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraforms"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

