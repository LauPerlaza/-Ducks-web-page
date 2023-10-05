variable "environment" {
  type = string
}

variable "vpc" {
  type = string
}

variable "port_to_allow" {
  type = number
}

variable "cidr_to_allow" {
  type = list
}
