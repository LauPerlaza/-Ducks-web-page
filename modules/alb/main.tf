# Terraform code to create Target Group and ALB

resource "aws_lb" "app_lb" {
    name = "ALB-${var.name_lb}"
    load_balancer_type = "application"
    security_groups = var.security_group
    subnets = [var.subnets[0], var.subnets[1]]
    internal           = false
    enable_deletion_protection = false
}

# ALB Listenet for HTTPS

resource "aws_lb_listener" "HTTPS_listener" {
  load_balancer_arn = aws_lb.app_lb.id
    port = "443"
    protocol = "HTTPS"
    certificate_arn = var.cert_arn
    default_action {
      target_group_arn = var.target_group
      type = "forward"
    }
  depends_on = [aws_lb.app_lb]
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


  



