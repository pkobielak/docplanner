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

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}
