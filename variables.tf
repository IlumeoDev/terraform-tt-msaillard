variable "vpn_instance_ip" {
  type        = string
  description = "The IP of the VPN instance"
}

variable "vpn_hosted_zone_name" {
  type        = string
  description = "The hosted zone name for the VPN"
}

variable "gitlab_instance_ip" {
  type        = string
  description = "The IP of the Gitlab instance"
}

variable "gitlab_hosted_zone_name" {
  type        = string
  description = "The hosted zone name for Gitlab"
}

variable "shared_hosted_zone_name" {
  type        = string
  description = "The shared hosted zone name"
}
