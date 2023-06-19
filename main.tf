terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 4.65"
    }
  }
}

provider "aws" {
  access_key = "Key"
  secret_key = "SK"
  region = "us-east-1"
}

module "AWSInfra" {
   source = "./modules"
}