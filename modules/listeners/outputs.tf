output "listener_arns" {
  value = {
    http  = aws_lb_listener.http.arn,
    https = aws_lb_listener.https.arn
  }
}
