terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-state-mybricks-2025"
    key            = "databricks/aws-prereqs.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    profile        = "DG4-Developer-065317679010"
    encrypt        = true
  }
}
