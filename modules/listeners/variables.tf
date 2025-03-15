variable "alb_arn" {
  type        = string
  description = "ARN of the Application Load Balancer"
}

variable "default_certificate_arn" {
  type        = string
  description = "Default SSL certificate for the ALB"
}

variable "default_target_group_arn" {
  type        = string
  description = "Default target group for the ALB"
}

variable "host_rules" {
  type = map(object({
    priority          = number
    host              = string
    target_group_arn  = string
  }))
  description = "Mapping of host-based routing rules"
}