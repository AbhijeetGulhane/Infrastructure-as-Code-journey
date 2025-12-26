module "portfolio_site" {
  source      = "./modules/s3-website" # Path to your blueprint
  bucket_name = "abhijeet-portfolio-bucket-2025"
  
  tags = {
    Project = "Infrastructure-as-Code-journey"
    Day     = "5"
  }
}