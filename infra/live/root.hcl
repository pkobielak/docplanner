remote_state {
  backend = "s3"
  config = {
    bucket         = "docplanner-tfstate-bucket"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = "docplanner-tfstate-lock"
    region         = "eu-north-1"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region = var.region
}
EOF
}
