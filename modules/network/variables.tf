variable "network_name" {
  type = string
  description = "VPC name"
}

variable "subnet_name" {
  type = string
  description = "subnet name"
}

variable "subnet_cidr" {
  type = string
  description = "range of ip"
}

variable "region" {
  type = string
  description = "region"
}