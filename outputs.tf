output "website_url" {
  description = "The public URL of the portfolio website"
  # We use '.website_url' because that is the name you gave it in the child module
  value       = "http://${module.portfolio_site.website_url}"
}