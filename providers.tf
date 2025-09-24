provider "github" {
  owner = var.github_organization 

  app_auth {
    id              = var.github_app_id  # or `GITHUB_APP_ID`
    installation_id = var.github_app_installation_id  # or `GITHUB_APP_INSTALLATION_ID`
    pem_file        = file(var.github_app_pem_file_path)  # Loads the file content dynamically
  }
}
