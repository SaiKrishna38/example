data "aws_caller_identity" "current" {}

locals {
  common_tags = {
    APPID       = var.app_id
    CreatedBy   = var.username
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

module "dbfs_bucket" {
  source     = "./modules/dbfs-bucket"
  account_id = data.aws_caller_identity.current.account_id
  region     = var.aws_region
  tags       = local.common_tags
}

module "cross_account_role" {
  source                 = "./modules/cross-account-role"
  account_id             = data.aws_caller_identity.current.account_id
  region                 = var.aws_region
  dbfs_bucket_name       = module.dbfs_bucket.bucket_name
  databricks_external_id = var.databricks_external_id
  tags                   = local.common_tags
}

module "unity_catalog" {
  source                    = "./modules/unity-catalog"
  count                     = var.enable_unity_catalog ? 1 : 0
  account_id                = data.aws_caller_identity.current.account_id
  region                    = var.aws_region
  unity_catalog_external_id = var.unity_catalog_external_id
  tags                      = local.common_tags
  unity_catalog_role_name   = var.unity_catalog_role_name
}


