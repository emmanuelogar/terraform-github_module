resource "github_repository" "this" {
  name        = var.name
  description = var.description

  visibility  = var.visibility

  allow_auto_merge           = var.allow_auto_merge
  allow_merge_commit         = var.allow_merge_commit
  allow_rebase_merge         = var.allow_rebase_merge
  allow_squash_merge         = var.allow_squash_merge
  archive_on_destroy         = var.archive_on_destroy
  auto_init                  = var.auto_init
  delete_branch_on_merge     = var.delete_branch_on_merge
  has_downloads              = var.has_downloads
  has_issues                 = var.has_issues
  has_projects               = var.has_projects
  has_wiki                   = var.has_wiki
  is_template                = var.is_template
  vulnerability_alerts       = var.vulnerability_alerts

  dynamic "pages" {
    for_each = var.pages != null ? [var.pages] : []
    content {
      source {
        branch = pages.value.source.branch
        path   = pages.value.source.path
      }
      build_type = pages.value.build_type
      cname      = pages.value.cname
    }
  }

  dynamic "security_and_analysis" {
    for_each = var.security_and_analysis != null ? [var.security_and_analysis] : []
    content {
      advanced_security {
        status = security_and_analysis.value.advanced_security.status
      }
      secret_scanning {
        status = security_and_analysis.value.secret_scanning.status
      }
      secret_scanning_push_protection {
        status = security_and_analysis.value.secret_scanning_push_protection.status
      }
    }
  }

  dynamic "template" {
    for_each = var.template != null ? [var.template] : []
    content {
      owner      = template.value.owner
      repository = template.value.repository
    }
  }

  topics = var.topics
}

resource "github_branch" "develop" {
  count = var.create_develop_branch ? 1 : 0

  repository    = github_repository.this.name
  branch        = "develop"
  source_branch = "main"  # Assumes main is the default branch
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.this.node_id

  pattern         = "main"
  enforce_admins  = true
  allows_deletions = false
  allows_force_pushes = false

  # Additional standard branch protection rules (e.g., require PR reviews)
  required_pull_request_reviews {
    required_approving_review_count = 2
  }
}

resource "github_branch_protection" "develop" {
  count = var.create_develop_branch ? 1 : 0

  repository_id = github_repository.this.node_id

  pattern         = "develop"
  enforce_admins  = true
  allows_deletions = false
  allows_force_pushes = false

  # Additional standard branch protection rules (e.g., require PR reviews)
  required_pull_request_reviews {
    required_approving_review_count = 2
  }

  depends_on = [github_branch.develop]
}

resource "github_actions_repository_permissions" "this" {
  repository      = github_repository.this.name
  enabled         = true
  allowed_actions = "local_only"  # Restricts to local/organization actions, blocking third-party
}