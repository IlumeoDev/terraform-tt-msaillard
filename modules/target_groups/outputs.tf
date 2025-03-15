output "target_group_arns" {
  value = { for k, tg in aws_lb_target_group.tg : k => tg.arn }
}
