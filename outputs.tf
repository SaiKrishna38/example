output "dbfs_bucket_name" {
  value = module.dbfs_bucket.bucket_name
}

output "databricks_cross_account_role_arn" {
  value = module.cross_account_role.role_arn
}

output "unity_catalog_bucket_name" {
  value = var.enable_unity_catalog ? module.unity_catalog[0].bucket_name : ""
}

output "unity_catalog_role_arn" {
  value = var.enable_unity_catalog ? module.unity_catalog[0].role_arn : ""
}

# New outputs for user management
output "databricks_users" {
  value       = var.enable_user_management ? module.databricks_users[0].created_users : {}
  description = "Map of created Databricks users"
}

output "databricks_groups" {
  value       = var.enable_user_management ? module.databricks_users[0].created_groups : {}
  description = "Map of created Databricks groups"
}

output "databricks_user_ids" {
  value       = var.enable_user_management ? module.databricks_users[0].user_ids : {}
  description = "Map of usernames to Databricks user IDs"
  sensitive   = true
}