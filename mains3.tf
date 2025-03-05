#jfrogtest.jenkins
pipeline{
    agent any
    tools {
        jfrog 'jfrog-cli'
    }
    stages {
        stage ('Testing') {
            steps {
                jf '-v' 
                jf 'c show'
                jf 'rt ping'
                sh 'touch test-file'
                jf 'rt u test-file jfrog-cli/'
                jf 'rt bp'
                jf 'rt dl jfrog-cli/test-file'
            }
        } 
    }
}

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