# Terraform code to create Target Group and ALB

resource "aws_lb" "app_lb" {
    name = "lb-test-2"
    load_balancer_type = "application"
    security_groups = [var.security_group]
    subnets = [var.subnets[0], var.subnets[1]]
    internal           = false
    enable_http2       = true
    idle_timeout       = 30

    enable_deletion_protection = false
}

# ALB Listenet for HTTP

resource "aws_lb_listener" "HTTP_listener" {
    load_balancer_arn = aws_lb.app_lb.id
    port = "80"
    protocol = "HTTP"
    default_action {
      target_group_arn = var.target_group
      type = "forward"
    }
  depends_on = [aws_lb.app_lb]
}

# Target Group for ALB

resource "aws_lb_target_group" "target_group" {
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
  



