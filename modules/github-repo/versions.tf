terraform {
  required_version = ">= 1.5"  # Use a recent stable version; adjust as needed

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"  # Ensures latest stable (6.6.0+), compatible with app_auth and resources used
    }
  }
}