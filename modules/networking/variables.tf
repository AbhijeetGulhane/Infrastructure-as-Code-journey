variable "project_name" { type = string }
variable "vpc_cidr"     { type = string }

variable "public_subnets" {
  type = map(object({ cidr = string, az = string }))
  default = {
    "public-1" = { cidr = "10.0.50.0/24", az = "us-east-1a" }
  }
}

variable "private_subnets" {
  type = map(object({ cidr = string, az = string }))
  default = {
    "priv-1" = { cidr = "10.0.60.0/24", az = "us-east-1a" }
  }
}