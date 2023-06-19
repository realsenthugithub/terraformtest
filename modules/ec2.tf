//Create ASG launch configuration for EC2
resource "aws_launch_configuration" "ec2_lc" {
  name          = "tf-ec2-lc"
  image_id      = "ami-0c94855ba95c71c99"  
  instance_type = "t2.micro"
  key_name = "tfkey"
  security_groups = [aws_security_group.tf-sg-asg.id]
  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing httpd web service ***"
  sudo yum install httpd -y
  sudo systemctl start httpd
  sudo systemctl enable httpd
  echo "*** Creating index.html ***"
  echo "Hello World" >> /var/www/html/index.html
  echo "*** Stop firewall ***"
  sudo systemctl stop firewalld
  echo "***  Completed ***"
  EOF
}

//Create ASG
resource "aws_autoscaling_group" "asg" {
  name                 = "tf-ec2-asg"
  launch_configuration = aws_launch_configuration.ec2_lc.name
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1
  target_group_arns    = [aws_lb_target_group.lb-tg.arn]

  vpc_zone_identifier = [
    aws_subnet.app1.id,
    aws_subnet.app2.id
  ]
}
