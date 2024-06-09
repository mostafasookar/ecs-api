
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  backend "s3" {
    bucket         = "api-tf-bkt"
    key            = "tf-state-setup"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "ap-tf-ddb"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      Contact     = var.contact
      ManageBy    = "Terraform/setup"
    }
  }
}