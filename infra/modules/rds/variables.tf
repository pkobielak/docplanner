variable "env" {
  description = "Environment, e.g. prod or test"
  type        = string
}

variable "region" {
  description = "AWS region, e.g. eu-north-1"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the EKS cluster"
  type        = map(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "database_subnet_group" {
  description = "Database subnet group name"
  type        = string
}
