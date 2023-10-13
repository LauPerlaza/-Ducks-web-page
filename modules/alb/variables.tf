variable "environment" {
  type = string
}

variable "subnets" {
  description = "subnets id for ALB"
  type        = list(any)
  default     = []
}

variable "security_group" {
  description = "Security group id for the ALB"
  type        = string
  default     = ""
}

variable "target_group" {
  description = "the arn of the target group created"
  type = string
}

variable "tg_port" {
  description = "the port that the targer group will use"
  type        = number
  default     = 80
}

variable "vpc" {
  description = "VPC id for Target Group"
  type = string
}

variable "tg_type" {
  description = "Target Group Type (instance,ip,lambda)"
  type        = string
  default     = ""
}

variable "protocol" {
  description = "Protocol that the target group will use"
  type        = string
  default     = ""
}

variable "health_check_path" {
  description = "the Path in which the alb will send health checks"
  type        = string
  default     = ""
}

variable "health_check_port" {
  description = "the Port in which the alb will send health checks"
  type        = number
  default     = 80
}

variable "name_tg" {
  description = "a name for target group or alb"
  type        = string
}