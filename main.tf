module "alb" {
  source = "./modules/alb"
  vpc_id = data.aws_vpc.shared.id
  subnets = [
    data.aws_subnet.private_networking_1.id,
    data.aws_subnet.private_networking_2.id,
    data.aws_subnet.private_networking_3.id
  ]
  security_group = module.security_group.alb_sg_id
}

module "target_groups" {
  source = "./modules/target_groups"
  vpc_id = data.aws_vpc.shared.id
  applications = {
    gitlab = { port = 80, protocol = "HTTP", instance_ip = var.gitlab_instance_ip },
    vpn    = { port = 443, protocol = "HTTPS", instance_ip = var.vpn_instance_ip }
  }
}

module "listeners" {
  source = "./modules/listeners"
  alb_arn = module.alb.alb_arn
  certificates = module.certificates.all_certificates
  target_groups = module.target_groups.target_group_arns
  hosted_zone_names = {
    vpn    = var.vpn_hosted_zone_name,
    gitlab = var.gitlab_hosted_zone_name
  }
}

module "certificates" {
  source = "./modules/certificates"
  hosted_zones = {
    shared = var.shared_hosted_zone_name,
    gitlab = var.gitlab_hosted_zone_name,
    vpn    = var.vpn_hosted_zone_name
  }
}

module "security_group" {
  source = "./modules/network"
  vpc_id = data.aws_vpc.shared.id
}
