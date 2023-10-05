variable "environment" {
  type = string
}

variable "tg_port" {
  type = string
}

variable "vpc" {
  type = string
}

variable "target_type" {
  type = string
}

variable "protocol" {
  type    = string
  default = "HTTP"
}