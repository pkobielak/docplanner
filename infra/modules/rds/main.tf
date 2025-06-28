terraform {
  backend "s3" {}
}

# TODO: Add RDS resources (aws_db_instance, aws_db_subnet_group, etc.)

data "aws_caller_identity" "current" {}
data "aws_availability_zones" "available" {}

locals {
  name = "rds-docplanner-${var.env}"
}

module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier                     = local.name
  instance_use_identifier_prefix = true

  create_db_option_group    = false
  create_db_parameter_group = false

  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  engine               = "postgres"
  engine_version       = "14"
  family               = "postgres14" # DB parameter group
  major_engine_version = "14"         # DB option group
  instance_class       = "db.t4g.small"

  # For devs to be able to connect to the DB securely
  iam_database_authentication_enabled = true

  allocated_storage = 20

  # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
  # "Error creating DB Instance: InvalidParameterValue: MasterUsername
  # user cannot be used as it is a reserved word used by the engine"
  db_name  = "docplanner"
  username = "docplannerMaster"
  port     = 5432

  db_subnet_group_name   = var.database_subnet_group
  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 0

  tags = var.tags
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = local.name
  description = "PostgreSQL security group"
  vpc_id      = var.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "PostgreSQL access from within VPC"
      cidr_blocks = var.vpc_cidr_block
    },
  ]

  tags = var.tags
}
