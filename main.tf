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

//Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "terraformvpc"
  }
}

//Create subnet for web, app and database tier
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "web"
  }
}


