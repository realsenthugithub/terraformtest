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
  secret_key = "PawJk5zYbBcxNCC5r/baeMBS09LTR17jBvF0o1ER"
  region = "us-east-1"
}

/* resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
}  */
