variable "environment" {
  type = string
}

variable "subnets" {
  type = list
}

variable "security_group" {
  type = list
}

variable "target_group" {
  type = string
}