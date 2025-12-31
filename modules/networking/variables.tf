variable "project_name" {
  description = "Name of the project used for tagging"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

# ... keep your public_subnets and private_subnets here as well

variable "public_subnets" {
  type = map(object({ cidr = string, az = string }))
  default = {
    "public-1" = { cidr = "10.0.50.0/24", az = "us-east-1a" }
    "public-2" = { cidr = "10.0.51.0/24", az = "us-east-1b" } # Add this line
  }
}

variable "private_subnets" {
  type = map(object({ cidr = string, az = string }))
  default = {
    "priv-1" = { cidr = "10.0.60.0/24", az = "us-east-1a" }
    "priv-2" = { cidr = "10.0.61.0/24", az = "us-east-1b" } # Best practice: match AZs
  }
}