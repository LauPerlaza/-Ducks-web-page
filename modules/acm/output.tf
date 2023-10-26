output "domain_name" {
   value = var.domain_name
}

output "acm_arn" {
   value = aws_acm_certificate.cert_acm.arn
}

output "acm_id" {
   value = aws_acm_certificate.cert_acm.id
}
