provider "aws" {
  region = var.aws_region
  profile ="DG4-Developer-065317679010"
  default_tags {
    tags = {
      APPID       = var.app_id
      CreatedBy   = var.username
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}

