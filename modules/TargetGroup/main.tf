resource "aws_lb_target_group" "tg_test_2" {
    name = "tg_test_2_${var.environment}"
    port = var.tg_port
    protocol = var.protocol
    target_type = var.target_type
    vpc_id = var.vpc

  }
