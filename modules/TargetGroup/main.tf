resource "aws_lb_target_group" "tg_test_2" {
    name = "tg-${var.name_tg}"
    port = var.tg_port
    protocol = var.protocol
    target_type = var.tg_type
    vpc_id = var.vpc
    health_check {
    enabled             = true
    interval            = 5
    path                = var.health_check_path 
    port                = var.health_check_port
    protocol            = var.protocol
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 3
    matcher             = "200"
  }
  lifecycle {
    create_before_destroy = true
  }
  }
  
