variable "aws_region" {
    description = "The AWS region where resources will be created."
    type        = string
    default     = "us-east-1"
}
variable "databricks_external_id" {
    description = "External ID provided by Databricks for the cross-account IAM role."
    type        = string
    sensitive   = true
}
variable "unity_catalog_external_id" {
    description = "External ID required for Unity Catalog IAM role assumption."
    type        = string
    sensitive   = true
    default     = ""
}
variable "enable_unity_catalog" {
    description = "Whether to provision Unity Catalog resources."
    type        = bool
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