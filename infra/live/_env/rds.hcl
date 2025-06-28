terraform {
  source = "${get_terragrunt_dir()}/../../../../modules/rds"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc.vpc_id
  vpc_cidr_block = dependency.vpc.outputs.vpc.vpc_cidr_block
  database_subnet_group = dependency.vpc.outputs.vpc.database_subnet_group
}
