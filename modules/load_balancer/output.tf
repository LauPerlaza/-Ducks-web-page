output "lb_test_2_dns" {
   value = aws_alb.lb_test_2.dns_name
}

output "lb_test_2_arn" {
   value = aws_alb.lb_test_2.arn
}

output "Zone_Id" {
  value = aws_alb.lb_test_2.zone_id
}