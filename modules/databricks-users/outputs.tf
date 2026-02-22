output "user_ids" {
  description = "Map of usernames to Databricks user IDs"
  value = merge(
    { for k, v in databricks_user.users : k => v.id },
    { for k, v in databricks_user.aws_iam_users : k => v.id }
  )
}

output "group_ids" {
  description = "Map of group names to Databricks group IDs"
  value       = { for k, v in databricks_group.groups : k => v.id }
}

output "created_users" {
  description = "List of created Databricks users"
  value = merge(
    { for k, v in databricks_user.users : k => v.user_name },
    { for k, v in databricks_user.aws_iam_users : k => v.user_name }
  )
}

output "created_groups" {
  description = "List of created Databricks groups"
  value       = { for k, v in databricks_group.groups : k => v.display_name }
}