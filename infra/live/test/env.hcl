# Environment-level configuration
locals {
  env = "test"
  env_tags = {
    GithubRepo = "docplanner"
    GithubOrg  = "pkobielak"
    Environment = local.env
  }
}
