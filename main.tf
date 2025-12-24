# This "searches" for your current AWS account info
data "aws_caller_identity" "current" {}

# This searches for the availability zones in your region
data "aws_availability_zones" "available" {
  state = "available"
}