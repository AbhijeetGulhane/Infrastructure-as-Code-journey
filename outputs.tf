output "account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "The AWS Account ID currently being used"
}

output "available_zones" {
  value       = data.aws_availability_zones.available.names
  description = "The list of availability zones in this region"
}