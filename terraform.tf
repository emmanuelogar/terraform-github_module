terraform {
  # required_version = ">= 1.5.0"  # Use a recent stable version; adjust as needed

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"  # Compatible with latest (6.6.0)
    }
  }

  # Optional: Configure remote backend for state management (e.g., S3, Terraform Cloud)
  # backend "s3" {
  #   bucket = "your-terraform-state-bucket"
  #   key    = "github-repos/terraform.tfstate"
  #   region = "us-west-2"
  # }
}