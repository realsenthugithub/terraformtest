/* source "aws_security_group" "lb_sg" {
  name        = "lb_security_group"
  description = "Security group for load balancer"
  vpc_id = aws_vpc.vpc_terraform.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
} */

resource "aws_lb" "alb_web" {
  name = "alb-web-terraform"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets           = [aws_subnet.web1.id, aws_subnet.web2.id]

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "lb-tg" {
  name     = "tf-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_terraform.id
}

resource "aws_lb_listener" "tf-alb-lis" {
  load_balancer_arn = aws_lb.alb_web.arn
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg.arn
  }
}

/* resource "aws_lb_target_group_attachment" "lb-tg-at" {
  target_group_arn = aws_lb_target_group.lb-tg.arn
  #target_group_arn = aws_lb.alb_web.arn
  target_id        = aws_autoscaling_group.asg.arn
  port             = 80
} */