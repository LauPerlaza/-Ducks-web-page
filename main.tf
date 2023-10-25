#Networking resources creation

module "networking_test_2" {
  source                    = "./modules/networking"
  ip                        = "67.73.233.197/32"
  region                    = var.region
  environment               = var.environment
  name_vpc                  = "vpc_test_2"
  cidr_block_vpc            = "10.0.0.0/16"
  cidr_block_subnet_public  = ["10.0.1.0/24", "10.0.2.0/24"]
  cidr_block_subnet_private = ["10.0.6.0/24", "10.0.7.0/24"]
}
## Security Group for EC2

resource "aws_security_group" "sec_ec2_test2" {
  depends_on  = [module.networking_test_2]
  name        = "secg_ec2_test_${var.environment}"
  description = "controls access to the EC2"
  vpc_id      = module.networking_test_2.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_lb.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

### EC2 resources creation

module "ec2_test" {
  depends_on    = [aws_security_group.sec_ec2_test2, module.networking_test_2]
  source        = "./modules/ec2"
  instance_type = var.environment == "staging" ? "t2.micro" : "t3.micro"
  subnet_id     = module.networking_test_2.subnet_id_sub_public1
  sg_ids        = [aws_security_group.sec_ec2_test2.id]
  name          = "ec2_test_2_${var.environment}"
  environment   = var.environment
}

#### Target Groups Creation

module "target_group" {
  source            = "./modules/target_group"
  name              = "tg-lb"
  environment       = var.environment
  vpc               = module.networking_test_2.vpc_id
  tg_type           = "instance"
  tg_port           = 80
  protocol          = "HTTP"
  health_check_path = "/"
}

##### Target Group Attachment Creation
resource "aws_lb_target_group_attachment" "tg_attachment" {
  target_group_arn = module.target_group.tg_arn
  target_id        = module.ec2_test.instance_id
  port             = 80
}

###### Security Group for ALB

resource "aws_security_group" "sg_lb" {
  name        = "sg_lb_${var.environment}"
  description = "controls access to the ALB"
  vpc_id      = module.networking_test_2.vpc_id
  tags = {
    Name = "sg_lb_${var.environment}"
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
###### ALB creation

module "application_lb" {
  depends_on     = [aws_security_group.sg_lb, module.acm_cert]
  source         = "./modules/alb"
  name_lb        = "alb-test-2"
  environment    = var.environment
  subnets        = [module.networking_test_2.subnet_id_sub_public1, module.networking_test_2.subnet_id_sub_public2]
  security_group = [aws_security_group.sg_lb.id]
  target_group   = module.target_group.tg_arn
  cert_arn       = module.acm_cert.acm_arn
  
}

####### ACM creation
module "acm_cert" {
  source      = "./modules/acm"
  domain_name = "rootdr.info"
  alternative_name = "ducks.rootdr.info"
}

