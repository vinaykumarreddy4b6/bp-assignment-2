provider "aws" {  
  region  = "ap-southeast-1"
}

resource "aws_ecr_repository" "splunk-assignment" {
  name = "splunk-assignment"
}
