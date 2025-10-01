terraform {
  required_version = ">= 1.5.0"

#   backend "azurerm" {
#     resource_group_name  = "rg-terraform-demo"       # Your RG
#     storage_account_name = "tfstateaccount"          # Your storage account
#     container_name       = "tfstate"                 # Container for state
#     key                  = "github-org/terraform.tfstate"
#   }
}