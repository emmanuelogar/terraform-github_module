variable "name" {
  type        = string
  description = "The name of the repository. Must follow kebab-case naming convention as per Confluence documentation."

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]*[a-z0-9]$", var.name))
    error_message = "Repository name must be in kebab-case: start with a lowercase letter, contain only lowercase letters, numbers, and hyphens, and not end with a hyphen. Refer to Confluence page for naming conventions."
  }
}

variable "description" {
  type        = string
  description = "A description of the repository."
  default     = ""
}

variable "visibility" {
  type        = string
  description = "The visibility of the repository. Enforced to 'private' or 'internal' per enterprise policy restricting public repositories."
  default     = "private"

  validation {
    condition     = contains(["private", "internal"], var.visibility)
    error_message = "Repository visibility must be 'private' or 'internal' to comply with enterprise repository creation and visibility policies."
  }
}

variable "allow_auto_merge" {
  type        = bool
  description = "allow auto-merging pull requests on the repository."
  default     = false
}

variable "allow_merge_commit" {
  type        = bool
  description = "Whether merge commits are allowed."
  default     = true
}

variable "allow_rebase_merge" {
  type        = bool
  description = "Whether rebase merges are allowed."
  default     = true
}

variable "allow_squash_merge" {
  type        = bool
  description = "Whether squash merges are allowed."
  default     = true
}

variable "archive_on_destroy" {
  type        = bool
  description = "Whether to archive the repository instead of deleting on destroy. Default true to enforce deletion policy."
  default     = true
}

variable "auto_init" {
  type        = bool
  description = "Whether to produce an initial commit in the repository. Default true to ensure main branch exists for protection."
  default     = true
}

variable "create_develop_branch" {
  type        = bool
  description = "Whether to create the develop branch and protect it."
  default     = true
}

variable "delete_branch_on_merge" {
  type        = bool
  description = "Whether to automatically delete head branches when pull requests are merged. Default true for cleanup."
  default     = true
}

variable "has_downloads" {
  type        = bool
  description = "Whether the downloads feature is enabled."
  default     = false
}

variable "has_issues" {
  type        = bool
  description = "Whether the issues feature is enabled. Default true, but can be restricted per issues deletion policy."
  default     = false
}

variable "has_projects" {
  type        = bool
  description = "Whether the projects feature is enabled."
  default     = false
}

variable "has_wiki" {
  type        = bool
  description = "Whether the wiki feature is enabled."
  default     = false
}

variable "is_template" {
  type        = bool
  description = "Whether this is a template repository."
  default     = false
}

variable "vulnerability_alerts" {
  type        = bool
  description = "Whether vulnerability alerts are enabled."
  default     = true
}

variable "pages" {
  type = object({
    build_type = optional(string)
    cname      = optional(string)
    source = object({
      branch = string
      path   = optional(string)
    })
  })
  description = "Configuration for GitHub Pages. Restricted per pages creation policy."
  default     = null
}

variable "security_and_analysis" {
  type = object({
    advanced_security = object({
      status = string
    })
    secret_scanning = object({
      status = string
    })
    secret_scanning_push_protection = object({
      status = string
    })
  })
  description = "Configuration for security and analysis features."
  default     = null
}

variable "template" {
  type = object({
    owner      = string
    repository = string
  })
  description = "Template repository to use."
  default     = null
}

variable "topics" {
  type        = list(string)
  description = "The list of topics for the repository."
  default     = []
}

variable "allowed_actions" {
  type        = string
  description = "Allowed actions policy (all, local_only, selected)"
  default     = "selected"
}

variable "patterns_allowed" {
  type        = list(string)
  description = "List of allowed action patterns when allowed_actions = selected"
  default     = [
  "actions/checkout@*",
  "hashicorp/setup-terraform@*",
  "actions/create-github-app-token@*",
]
}

variable "github_owned_allowed" {
  type        = bool
  description = "Allow all GitHub-owned actions if true"
  default     = true
}

variable "verified_allowed" {
  type        = bool
  description = "Allow all verified creator actions if true"
  default     = true
}

variable "enabled_repositories" {
  description = "Which repositories are enabled for GitHub Actions: all, none, or selected"
  type        = string
  default     = "all"
}
