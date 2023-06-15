
resource "aws_instance" "app-svr" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.app.id
  tags = {
    Name = "app-svr"
  }
}

