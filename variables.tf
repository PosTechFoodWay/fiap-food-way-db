variable "aws_default_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "foodway_db_user" {
  description = "Application DB instance username"
  type        = string
}

variable "foodway_db_password" {
  description = "Application DB instance password"
  type        = string
}
