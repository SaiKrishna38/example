output "bucket_name" {
  description = "Name of the DBFS S3 bucket."
  value = aws_s3_bucket.dbfs_root.bucket
}

output "bucket_arn" {
  description = "ARN of the DBFS S3 bucket."
  value       = aws_s3_bucket.dbfs_root.arn
}

output "bucket_id" {
  description = "ID (name) of the DBFS S3 bucket."
  value       = aws_s3_bucket.dbfs_root.id
}