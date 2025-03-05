#mains3.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.85.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "my_s3_bucket" {
  bucket_prefix = "jaes-jenkins-bucket"

  tags = {
    Name        = "my_s3_bucket"
    Environment = "Production"
  }
}