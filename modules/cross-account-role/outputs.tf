output "role_arn" {
  value = aws_iam_role.databricks_cross_account.arn
}

output "role_name" {
  value = aws_iam_role.databricks_cross_account.name
}