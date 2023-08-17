terraform {
  backend "local" {
  }
  required_version = ">=0.13"
}

provider "aws" {
  # profile = "my_aws_creds"
  region = "eu-west-2"
}

#########################################################
# S3 Bucket
#########################################################
resource "aws_s3_bucket" "mmlab_ps_workshop_s3_001" {
  bucket = "mmlab-ps-workshop-s3-001"

  tags = {
    "Name"      = "mmlab-ps-workshop-s3-001-20230817"
    "Terraform" = "true"
  }
}

resource "aws_s3_bucket_versioning" "mmlab_ps_workshop_s3_001_versioning" {
  bucket = aws_s3_bucket.mmlab_ps_workshop_s3_001.id
  versioning_configuration {
    status = "Disabled"
  }
}
