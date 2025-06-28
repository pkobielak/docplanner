locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  env_name = local.env_vars.locals.env
  region_name = local.region_vars.locals.region
  merged_tags = merge(
    local.env_vars.locals.env_tags,
    local.region_vars.locals.region_tags
  )
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "rds" {
  path = "${get_terragrunt_dir()}/../../../_env/rds.hcl"
}

inputs = {
  env = local.env_name
  region = local.region_name
  tags = local.merged_tags
}
