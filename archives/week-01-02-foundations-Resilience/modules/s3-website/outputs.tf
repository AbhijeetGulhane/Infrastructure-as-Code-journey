output "website_url" {
  # This matches the resource name inside the module's main.tf
  value = aws_s3_bucket_website_configuration.this.website_endpoint
}