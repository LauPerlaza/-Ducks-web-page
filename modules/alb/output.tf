output "lb_dns" {
   value = aws_lb.app_lb.dns_name
}

output "lb_arn" {
   value = aws_lb.app_lb.arn
}

output "lb_id" {
   value = aws_lb.app_lb.id
}

output "Zone_Id" {
  value = aws_lb.app_lb.zone_id
}