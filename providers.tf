terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "prod-tfstate-rg"            # RG jisme storage account bana hai
    storage_account_name = "prodstg006"         # Storage account name (lowercase only)
    container_name       = "tfstatefile"                  # Blob container jisme state store hoga
    key                  = "terraform.tfstate"        # State file ka naam
  }

}

provider "azurerm" {
  features {}
  subscription_id = "ff9732b6-644f-42fb-aad3-79fa3d280afd"

#   # use_oidc = true
#   client_id       = var.client_id        # GitHub Action se milega
#   client_secret   = var.client_secret
#   tenant_id       = var.tenant_id
#   subscription_id = var.subscription_id
}
