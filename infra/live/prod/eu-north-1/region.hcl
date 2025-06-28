# Region-level configuration
locals {
  region = "eu-north-1"
  region_tags = {
    Region = local.region
  }
}
