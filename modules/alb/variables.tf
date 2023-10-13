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
  type        = list(any)
}

variable "target_group" {
  description = "the arn of the target group created"
  type = string
}

variable "name_lb" {
  description = "a name for alb"
  type        = string
}

variable "cert_arn" {
  type = string
}
