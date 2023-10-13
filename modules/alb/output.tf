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

output "TargetGroup_arn" {
    value = aws_lb_target_group.app_lb.arn
}
output "TargetGroup_name" {
    value = aws_lb_target_group.app_lb.name
}