output "bucket_name" {
  value       = aws_s3_bucket.unity_catalog.bucket
  description = "Name of the Unity Catalog S3 bucket"
}

output "role_arn" {
  value       = aws_iam_role.unity_catalog_role.arn
  description = "ARN of the Unity Catalog IAM role"
}

output "bucket_arn" {
  description = "ARN of the Unity Catalog metastore S3 bucket."
  value       = aws_s3_bucket.unity_catalog.arn
}

output "role_name" {
  description = "Name of the Unity Catalog IAM role."
  value       = aws_iam_role.unity_catalog_role
}