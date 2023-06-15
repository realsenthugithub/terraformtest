terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.65"
    }
  }
}

provider "aws" {
  access_key = "AKIAYA63NFZAM3GCSUFQ"
  secret_key = "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"
  region = "us-east-1"
}

module "AWSInfra" {
   source = "./modules"
}