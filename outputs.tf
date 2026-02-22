output "dbfs_bucket_name" {
  value = module.dbfs_bucket.bucket_name
}

output "databricks_cross_account_role_arn" {
  value = module.cross_account_role.role_arn
}

output "unity_catalog_bucket_name" {
  value = var.enable_unity_catalog ? module.unity_catalog[0].bucket_name : ""
}

output "unity_catalog_role_arn" {
  value = var.enable_unity_catalog ? module.unity_catalog[0].role_arn : ""
}
