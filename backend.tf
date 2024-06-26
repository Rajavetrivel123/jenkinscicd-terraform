terraform {
  backend "s3" {
    bucket         = "terraform.s3.22-04-24"
    key            = "jenkins"
    region         = "ap-south-1"
    encrypt        = true
    #dynamodb_table = "terraforms"
  }
}

