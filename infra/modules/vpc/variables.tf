variable "env" {
  description = "Environment, e.g. prod or test"
  type        = string
}

variable "region" {
  description = "AWS region, e.g. eu-north-1"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the VPC"
  type        = map(string)
}
