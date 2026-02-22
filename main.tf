data "aws_caller_identity" "current" {}

module "dbfs_bucket" {
  source     = "./modules/dbfs-bucket"
  account_id = data.aws_caller_identity.current.account_id
  region     = var.aws_region
}

module "cross_account_role" {
  source                 = "./modules/cross-account-role"
  account_id             = data.aws_caller_identity.current.account_id
  region                 = var.aws_region
  dbfs_bucket_name       = module.dbfs_bucket.bucket_name
  databricks_external_id = var.databricks_external_id
}

module "unity_catalog" {
  source                    = "./modules/unity-catalog"
  count                     = var.enable_unity_catalog ? 1 : 0
  account_id                = data.aws_caller_identity.current.account_id
  region                    = var.aws_region
  unity_catalog_external_id = var.unity_catalog_external_id
}

# New module for user management
module "databricks_users" {
  source = "./modules/databricks-users"
  count  = var.enable_user_management ? 1 : 0

  databricks_account_id   = var.databricks_account_id
  databricks_workspace_url = var.databricks_workspace_url

  # Define groups to create
  create_groups = {
    data_engineers = {
      display_name = "Data Engineers"
      description  = "Data Engineering team with access to ETL resources"
    }
    data_analysts = {
      display_name = "Data Analysts"
      description  = "Data Analytics team with read access"
    }
    ml_engineers = {
      display_name = "ML Engineers"
      description  = "Machine Learning team"
    }
  }

  # Define users to add
  users = {
    john_doe = {
      email      = "john.doe@company.com"
      first_name = "John"
      last_name  = "Doe"
      groups     = ["data_engineers"]
      is_admin   = true
    }
    jane_smith = {
      email      = "jane.smith@company.com"
      first_name = "Jane"
      last_name  = "Smith"
      groups     = ["data_analysts"]
      is_admin   = false
    }
  }

  # Sync existing AWS IAM users
  aws_iam_users = [
    # Add your existing AWS IAM usernames here
    # "aws-user-1",
    # "aws-user-2",
  ]

  auto_add_to_workspace = true
}
