resource "aws_lb_target_group" "tg_test_2" {
    name = "tg-test-2-${var.environment}"
    port = var.tg_port
    protocol = var.protocol
    target_type = var.target_type
    vpc_id = var.vpc

  }

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.tg_test_2.arn
  target_id        = aws_instance.tg_test_2.id
  port             = 80
}
  
  
