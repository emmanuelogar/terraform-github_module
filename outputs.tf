output "repo_full_name" {
  description = "Full name of the created repository (owner/name)."
  value       = module.github_repo.full_name
}

output "repo_html_url" {
  description = "Web URL of the repository."
  value       = module.github_repo.html_url
}

output "repo_ssh_clone_url" {
  description = "SSH clone URL of the repository."
  value       = module.github_repo.ssh_clone_url
}

output "repo_git_clone_url" {
  description = "HTTPS clone URL of the repository."
  value       = module.github_repo.git_clone_url
}