resource "aws_iam_role" "databricks_cross_account" {
  name = "databricks-cross-account-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = "arn:aws:iam::414351767826:root"
      }
      Action = "sts:AssumeRole"
      Condition = {
        StringEquals = {
          "sts:ExternalId" = var.databricks_external_id
        }
      }
    }]
  })
  tags = merge(var.tags, {
    Name    = var.role_name
    Purpose = "DatabricksCrossAccount"
  }) 
}