resource "aws_lb" "main" {
  name               = var.alb_name
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = [var.security_group]
  subnets            = var.subnets

  drop_invalid_header_fields = true
  enable_deletion_protection = false

  tags = {
    Name = var.alb_name
  }
}
