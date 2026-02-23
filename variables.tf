variable "aws_region" {}
variable "databricks_external_id" {}
variable "unity_catalog_external_id" {
  default = null
}
variable "enable_unity_catalog" {
  default = false
}
variable "app_id" {
  description = "Application ID for cost monitoring and tagging (e.g. APP-12345)."
  type        = string
}

variable "username" {
  description = "Username of the person who created/owns these resources (e.g. jdoe)."
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g. dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "unity_catalog_role_name" {
  description = "Name of the IAM role for Unity Catalog."
  type        = string
  default     = "unity-catalog-role"
}