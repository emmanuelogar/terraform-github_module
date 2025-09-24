output "full_name" {
  description = "The full name of the repository (owner/name)."
  value       = github_repository.this.full_name
}

output "html_url" {
  description = "The URL to the repository on the web."
  value       = github_repository.this.html_url
}

output "ssh_clone_url" {
  description = "The URL to clone the repository using SSH."
  value       = github_repository.this.ssh_clone_url
}

output "git_clone_url" {
  description = "The URL to clone the repository using HTTPS."
  value       = github_repository.this.git_clone_url
}