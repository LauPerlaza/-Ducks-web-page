output "tg_arn" {
    value = aws_lb_target_group.tg_group.arn
}
output "tg_name" {
    value = aws_lb_target_group.tg_group.name
}