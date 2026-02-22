# Fetch existing AWS IAM users
data "aws_iam_user" "existing_users" {
  for_each  = toset(var.aws_iam_users)
  user_name = each.value
}

# Get AWS account details
data "aws_caller_identity" "current" {}