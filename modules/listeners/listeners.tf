resource "aws_lb_listener" "https" {
  load_balancer_arn = var.alb_arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = var.default_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = var.default_target_group_arn
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = var.alb_arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener_rule" "host_based" {
  for_each = var.host_rules

  listener_arn = aws_lb_listener.https.arn
  priority     = each.value.priority

  action {
    type             = "forward"
    target_group_arn = each.value.target_group_arn
  }

  condition {
    host_header {
      values = [each.value.host]
    }
  }
}