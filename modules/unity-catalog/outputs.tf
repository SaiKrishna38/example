output "bucket_name" {
  value       = aws_s3_bucket.unity_catalog.bucket
  description = "Name of the Unity Catalog S3 bucket"
}

output "role_arn" {
  value       = aws_iam_role.unity_catalog_role.arn
  description = "ARN of the Unity Catalog IAM role"
}
