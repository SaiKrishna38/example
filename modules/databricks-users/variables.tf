variable "databricks_account_id" {
  description = "Databricks Account ID"
  type        = string
}

variable "databricks_workspace_url" {
  description = "Databricks workspace URL (e.g., https://your-workspace.cloud.databricks.com)"
  type        = string
}

variable "users" {
  description = "Map of users to add to Databricks"
  type = map(object({
    email      = string
    first_name = string
    last_name  = string
    groups     = list(string)
    is_admin   = optional(bool, false)
  }))
  default = {}
}

variable "create_groups" {
  description = "Map of groups to create in Databricks"
  type = map(object({
    display_name = string
    description  = optional(string, "")
  }))
  default = {}
}

variable "aws_iam_users" {
  description = "List of existing AWS IAM usernames to sync"
  type        = list(string)
  default     = []
}

variable "auto_add_to_workspace" {
  description = "Automatically add users to workspace"
  type        = bool
  default     = true
}