variable "alb_name" {
  type        = string
  description = "The name of the ALB"
}

variable "internal" {
  type        = bool
  description = "Whether the ALB is internal or internet-facing"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnets for the ALB"
}

variable "security_group" {
  type        = string
  description = "Security group ID for the ALB"
}
