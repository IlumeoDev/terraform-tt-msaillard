resource "aws_acm_certificate" "cert" {
  for_each = var.hosted_zones

  domain_name       = each.value
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_validation" {
  for_each = aws_acm_certificate.cert

  certificate_arn         = each.value.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation[each.key] : record.fqdn]
}

resource "aws_route53_record" "cert_validation" {
  for_each = aws_acm_certificate.cert

  allow_overwrite = true
  name            = each.value.domain_validation_options[0].resource_record_name
  records         = [each.value.domain_validation_options[0].resource_record_value]
  ttl             = 60
  type            = each.value.domain_validation_options[0].resource_record_type
  zone_id         = data.aws_route53_zone.hosted_zones[each.key].zone_id
}