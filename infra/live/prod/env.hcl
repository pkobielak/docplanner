# Environment-level configuration
locals {
  env = "prod"
  env_tags = {
    GithubRepo = "docplanner"
    GithubOrg  = "pkobielak"
    Environment = local.env
  }
}
