variable "name" {
  type = string
}

variable "vpc_zone_identifier" {
    type = list(any)  
}

variable "launch_configuration" {
  type = string
}

variable "max_size" {
  type = string
}

variable "min_size" {
  type = string  
}

variable "target_group_arns" {
  type = list(any)
}