variable "region" {
  type        = string
  description = "Region"
  default     = "us-east-1"
}
variable "environment" {
  type    = string
  default = "develop"
}

variable "domain_name" {
  type = string
  default = "rootdr.info"
}

variable "alternative_name" {
  type = string
  default = "value"
  
}