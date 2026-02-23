variable "role_name" {
  description = "Name of the Databricks cross-account IAM role."
  type        = string
  default     = "databricks-cross-account-role"
}

variable "databricks_account_id" {
  description = "Databricks AWS account ID used in the trust policy."
  type        = string
  default     = "414351767826"
}

variable "databricks_external_id" {
  description = "External ID from the Databricks account console."
  type        = string
  sensitive   = true
}

variable "dbfs_bucket_name" {
  description = "Name of the DBFS root S3 bucket (used in the IAM policy)."
  type        = string
}

variable "region" {
  description = "AWS region (used in CloudWatch/SNS/SQS/EventBridge resource ARNs)."
  type        = string
}

variable "account_id" {
  description = "AWS account ID (used in resource ARNs)."
  type        = string
}

variable "tags" {
  description = "Map of tags to apply to all resources (must include APPID and CreatedBy)."
  type        = map(string)
  default     = {}
}
