resource "aws_s3_bucket" "dbfs_root" {
  bucket = "databricks-root-storage-${var.account_id}-${var.region}"

  force_destroy = false
  tags = merge(var.tags, {
    Name    =  aws_s3_bucket.dbfs_root.bucket
    Purpose = "DatabricksDBFS"
  })
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.dbfs_root.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.dbfs_root.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.dbfs_root.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Bucket policy: allow Databricks EC2 instances (via cross-account role) to read/write
resource "aws_s3_bucket_policy" "dbfs" {
  bucket = aws_s3_bucket.dbfs_root.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DenyNonSSL"
        Effect = "Deny"
        Principal = "*"
        Action   = "s3:*"
        Resource = [
          aws_s3_bucket.dbfs_root.arn,
          "${aws_s3_bucket.dbfs_root.arn}/*"
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