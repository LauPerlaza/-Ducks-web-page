variable "environment" {
  type = string
}

variable "tg_port" {
  type = string
}

variable "vpc" {
  type = string
}

variable "tg_type" {
  type = string
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "health_check_path" {
  type        = string
  default     = ""
}

variable "health_check_port" {
  type        = number
  default     = 80
}

variable "name_tg" {
  type = string  
}