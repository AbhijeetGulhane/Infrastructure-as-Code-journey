module "portfolio_site" {
  source      = "./modules/s3-website"
  bucket_name = "abhijeet-portfolio-${terraform.workspace}-2025"
}
