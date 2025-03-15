resource "aws_lb_target_group" "tg" {
  for_each = var.applications

  name        = each.key
  port        = each.value.port
  protocol    = each.value.protocol
  target_type = "ip"
  vpc_id      = var.vpc_id
}

resource "aws_lb_target_group_attachment" "tg_attachment" {
  for_each = var.applications

  target_group_arn = aws_lb_target_group.tg[each.key].arn
  target_id        = each.value.instance_ip
}
