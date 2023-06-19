//Create VPC
resource "aws_vpc" "vpc_terraform" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "terraformvpc"
  }
}


//Create Internet Gateway
resource "aws_internet_gateway" "gw_terraform" {
  vpc_id = aws_vpc.vpc_terraform.id
  tags = {
    Name = "Terraform Gateway"
  }
}


//Create route table and add public subnet to route table
resource "aws_route_table" "tf-rt" {
  vpc_id = aws_vpc.vpc_terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_terraform.id
  }

  tags = {
    Name = "Terraform Route Table"
  }
}

resource "aws_main_route_table_association" "tf-mrta" {
  vpc_id         = aws_vpc.vpc_terraform.id
  route_table_id = aws_route_table.tf-rt.id
}


//Create subnet for web, app and database tier
resource "aws_subnet" "web1" {
  vpc_id     = aws_vpc.vpc_terraform.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "web1"
    Tier = "public"
  }
}

resource "aws_subnet" "web2" {
  vpc_id     = aws_vpc.vpc_terraform.id
  cidr_block = "10.1.0.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "web2"
    Tier = "public"
  }
}

resource "aws_subnet" "app1" {
  vpc_id     = aws_vpc.vpc_terraform.id
  cidr_block = "10.1.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "app1"
  }
}

resource "aws_subnet" "app2" {
  vpc_id     = aws_vpc.vpc_terraform.id
  cidr_block = "10.1.5.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "app2"
  }
}

resource "aws_subnet" "database" {
  vpc_id     = aws_vpc.vpc_terraform.id
  cidr_block = "10.1.4.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "database"
  }
}
