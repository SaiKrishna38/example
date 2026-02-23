variable "account_id" {
  description = "The AWS account ID used to uniquely identify resources."
  type        = string
}

variable "region" {
  description = "The AWS region where resources will be created."
  type        = string
}

variable "unity_catalog_external_id" {
  description = "External ID required for Unity Catalog IAM role assumption."
  type        = string
}

variable "unity_catalog_role_name" {
  description = "Name of the IAM role for Unity Catalog."
  type        = string
  default     = "unity-catalog-role"
}

variable "tags" {
  description = "Map of tags to apply to all resources (must include APPID and CreatedBy)."
  type        = map(string)
  default     = {}
}