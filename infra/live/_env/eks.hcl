terraform {
  source = "${get_terragrunt_dir()}/../../../../modules/eks"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc.vpc_id
  subnet_ids = dependency.vpc.outputs.vpc.private_subnets
}
