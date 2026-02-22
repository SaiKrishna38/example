resource "aws_iam_role_policy" "databricks_policy" {
  role = aws_iam_role.databricks_cross_account.id

  policy = templatefile("${path.module}/databricks-policy.json", {
    dbfs_bucket_name = var.dbfs_bucket_name
    region = var.region
    account_id = var.account_id
  })
}

resource "aws_iam_role_policy" "s3_access" {
  role = aws_iam_role.databricks_cross_account.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = "arn:aws:s3:::${var.dbfs_bucket_name}"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = "arn:aws:s3:::${var.dbfs_bucket_name}/*"
      }
    ]
  })
}