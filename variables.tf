variable "github_app_id" {
  type        = number
  description = "GitHub App ID"
  sensitive   = true  # Masks in Terraform output
}

variable "github_app_installation_id" {
  type        = number
  description = "GitHub App Installation ID"
  sensitive   = true
}

variable "github_app_pem_file_path" {
  type        = string
  description = "Path to the GitHub App private key PEM file"
  sensitive   = true
}

variable "github_organization" {
  type        = string
  description = "GitHub organization name if managing org repositories."
  default     = null  # Set to your org name or leave null for personal repos
}

variable "repo_name" {
  type        = string
  description = "Name of the repository (must follow kebab-case)."
}

variable "repo_description" {
  type        = string
  description = "Description of the repository."
  default     = "Managed by Terraform"
}

variable "repo_visibility" {
  type        = string
  description = "Repository visibility ('private' or 'internal')."
  default     = "private"
}

variable "create_develop_branch" {
  type        = bool
  description = "Whether to create and protect the develop branch."
  default     = true
}

# variable "github_token" {
#   type        = string
#   description = "GitHub token with appropriate permissions."
#   sensitive   = true
# }