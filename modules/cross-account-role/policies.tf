resource "aws_iam_role_policy" "databricks_policy" {
  role = aws_iam_role.databricks_cross_account.id
  policy = templatefile("${path.module}/databricks-policy.json", {
    dbfs_bucket_name = var.dbfs_bucket_name
    region = var.region
    account_id = var.account_id
  })
}