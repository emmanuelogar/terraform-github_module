module "github_repo" {
  source = "./modules/github-repo"  # Local path; use Git source for remote modules

  name                    = var.repo_name
  description             = var.repo_description
  visibility              = var.repo_visibility
  create_develop_branch   = var.create_develop_branch

  # providers = {
  #     github = github  # Passes auth to module resources
  #   }
}