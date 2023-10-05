#Este modulo crea el networking de la infraestructura 

module "networking_test_2" {
  source                      = "./modules/networking"
  ip                          = "67.73.233.197/32"
  region                      = var.region
  environment                 = var.environment
  name_vpc                    = "vpc_test_2"
  cidr_block_vpc              = "10.0.0.0/16"
  cidr_block_subnet_public    = ["10.0.1.0/24", "10.0.2.0/24"]
  cidr_block_subnet_private   = ["10.0.6.0/24", "10.0.7.0/24"]
}
#Este recurso crea un grupo de seguridad para la instancia de EC2. 
#Dependiendo del módulo "networking_test_2"

resource "aws_security_group" "security_group_ec2_test_2" {
  depends_on  = [module.networking_test_2]
  name        = "security_group_ec2_test"
  description = "aws_security_group_ec2_test"
  vpc_id      = module.networking_test_2.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
module "ec2_test" {
  depends_on    = [aws_security_group.security_group_ec2_test_2, module.networking_test_2]
  source        = "./modules/ec2"
  instance_type = var.environment == "staging" ? "t2.micro" : "t3.micro"
  subnet_id     = module.networking_test_2.subnet_id_sub_public1
  sg_ids        = [aws_security_group.security_group_ec2_test_2.id]
  name          = "ec2_test_2"
  environment   = var.environment
}

module "sg_lb_test_2" {
    source = "./modules/security_group"
    environment = var.environment
    vpc = modules.networking.vpc_id
    port_to_allow  = 80
    cidr_to_allow = ["0.0.0.0/0"]
}

module "tg_test_2" {
  source = "./modules/TargetGroup"
  environment = var.environment
  vpc = modules.networking.vpc_id
  target_type = "instance"
  tg_port = 80

}

