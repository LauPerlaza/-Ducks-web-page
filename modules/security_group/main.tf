resource "aws_security_group" "sg" {
  name        = "sg_test_2_${var.environment}"
  description = "security_group_test_2_lb"
  vpc_id      = var.vpc

  ingress {
    from_port   = var.port_to_allow
    to_port     = var.port_to_allow
    protocol    = "tcp"
    cidr_blocks = var.cidr_to_allow
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}