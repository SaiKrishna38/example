output "dbfs_bucket_name" {
  value = module.dbfs_bucket.bucket_name
}

output "dbfs_bucket_arn" {
  description = "ARN of the DBFS root S3 bucket."
  value       = module.dbfs_bucket.bucket_arn
}

# output "databricks_cross_account_role_arn" {
#   value = module.cross_account_role.role_arn
# }

# output "unity_catalog_bucket_name" {
#   value = var.enable_unity_catalog ? module.unity_catalog[0].bucket_name : ""
# }

# output "unity_catalog_role_arn" {
#   value = var.enable_unity_catalog ? module.unity_catalog[0].role_arn : ""
# }

# output "unity_catalog_bucket_arn" {
#   description = "ARN of the Unity Catalog metastore S3 bucket."
#   value       = var.enable_unity_catalog ? module.unity_catalog[0].bucket_arn : null
# }
