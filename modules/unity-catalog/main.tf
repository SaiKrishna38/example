resource "aws_s3_bucket" "unity_catalog" {
  bucket = "unity-catalog-metastore-${var.account_id}-${var.region}"
}

resource "aws_iam_role" "unity_catalog_role" {
  name = "unity-catalog-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = "arn:aws:iam::414351767826:role/unity-catalog-prod-UCMasterRole-14S5ZJVKOTYTL"
      }
      Action = "sts:AssumeRole"
      Condition = {
        StringEquals = {
          "sts:ExternalId" = var.unity_catalog_external_id
        }
      }
    }]
  })
}
