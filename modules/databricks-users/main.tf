terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# # Create Databricks groups
# resource "databricks_group" "groups" {
#   for_each     = var.create_groups
#   display_name = each.value.display_name
# }

# # Add manually specified users
# resource "databricks_user" "users" {
#   for_each   = var.users
#   user_name  = each.value.email
#   display_name = "${each.value.first_name} ${each.value.last_name}"
#   active     = true
  
#   force      = true  # Force creation even if user exists
# }

# # Add AWS IAM users to Databricks (sync from AWS)
# resource "databricks_user" "aws_iam_users" {
#   for_each = { for username, user in data.aws_iam_user.existing_users : username => user }
  
#   user_name    = each.value.user_name
#   display_name = each.value.user_name
#   active       = true
  
#   force = true
# }

# # Assign manually specified users to groups
# resource "databricks_group_member" "user_group_membership" {
#   for_each = merge([
#     for user_key, user in var.users : {
#       for group in user.groups :
#       "${user_key}-${group}" => {
#         user_id  = databricks_user.users[user_key].id
#         group_id = databricks_group.groups[group].id
#       }
#     }
#   ]...)

#   member_id = each.value.user_id
#   group_id  = each.value.group_id
# }

# # Grant admin privileges if specified
# resource "databricks_group_member" "admin_users" {
#   for_each = {
#     for user_key, user in var.users :
#     user_key => user if user.is_admin
#   }

#   member_id = databricks_user.users[each.key].id
#   group_id  = data.databricks_group.admins.id
# }

# # Get the admins group
# data "databricks_group" "admins" {
#   display_name = "admins"
# }

# module "databricks_users" {
#   source = "./modules/databricks-users"
#   count  = var.enable_user_management ? 1 : 0

#   databricks_account_id    = var.databricks_account_id
#   databricks_workspace_url = var.databricks_workspace_url

#   # Define groups to create
#   create_groups = {
#     data_engineers = {
#       display_name = "Data Engineers"
#       description  = "Data Engineering team"
#     }
#     data_analysts = {
#       display_name = "Data Analysts"
#       description  = "Data Analytics team"
#     }
#     ml_engineers = {
#       display_name = "ML Engineers"
#       description  = "Machine Learning team"
#     }
#     developers = {
#       display_name = "Developers"
#       description  = "Development team"
#     }
#   }

#   # Add your users here
#   users = {
#     user1 = {
#       email      = "user1@yourcompany.com"
#       first_name = "First"
#       last_name  = "User"
#       groups     = ["data_engineers", "developers"]
#       is_admin   = true
#     }
#     user2 = {
#       email      = "user2@yourcompany.com"
#       first_name = "Second"
#       last_name  = "User"
#       groups     = ["data_analysts"]
#       is_admin   = false
#     }
#     user3 = {
#       email      = "user3@yourcompany.com"
#       first_name = "Third"
#       last_name  = "User"
#       groups     = ["ml_engineers"]
#       is_admin   = false
#     }
#   }

#   # List existing AWS IAM users to sync (optional)
#   aws_iam_users = [
#     # "aws-iam-user-1",
#     # "aws-iam-user-2",
#   ]

#   auto_add_to_workspace = true
# }