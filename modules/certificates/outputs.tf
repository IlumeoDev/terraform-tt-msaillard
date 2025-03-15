output "all_certificates" {
  value = { for k, cert in aws_acm_certificate.cert : k => cert.arn }
}