resource "aws_iam_role_policy" "unity_catalog_s3_access" {
  name = "${var.unity_catalog_role_name}-s3-policy"
  role = aws_iam_role.unity_catalog_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:ListBucket", "s3:GetBucketLocation"
        ],
        Resource = "arn:aws:s3:::${aws_s3_bucket.unity_catalog.bucket}"
      },
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject","s3:AbortMultipartUpload",
          "s3:ListMultipartUploadParts",
        ],
        Resource = "arn:aws:s3:::${aws_s3_bucket.unity_catalog.bucket}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_policy" "unity_catalog" {
  bucket = aws_s3_bucket.unity_catalog.id
  depends_on = [aws_s3_bucket_public_access_block.unity_catalog]
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyNonSSL"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.unity_catalog.arn,
          "${aws_s3_bucket.unity_catalog.arn}/*",
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
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
    },
      {
        Sid    = "SelfAssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.account_id}:role/${var.unity_catalog_role_name}"
        }
        Action = "sts:AssumeRole"
        Condition = {
          StringEquals = {
            "sts:ExternalId" = var.unity_catalog_external_id
          }
        }
      }
    ]
  })
  tags = merge(var.tags, {
    Name    = var.unity_catalog_role_name
    Purpose = "DatabricksUnityCatalog"
  })
}