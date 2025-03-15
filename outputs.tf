output "alb_arn" {
  value = module.alb.alb_arn
}

output "target_group_arns" {
  value = module.target_groups.target_group_arns
}

output "listener_arns" {
  value = module.listeners.listener_arns
}

output "certificate_arns" {
  value = module.certificates.all_certificates
}
