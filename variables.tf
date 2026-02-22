variable "aws_region" {}
variable "databricks_external_id" {}
variable "unity_catalog_external_id" {
  default = null
}
variable "enable_unity_catalog" {
  default = false
}
variable "databricks_workspace_url" {
  description = "Databricks workspace URL"
  type        = string
  default     = ""
}

variable "databricks_account_id" {
  description = "Databricks Account ID"
  type        = string
  default     = ""
}

variable "enable_user_management" {
  description = "Enable Databricks user management"
  type        = bool
  default     = false
}