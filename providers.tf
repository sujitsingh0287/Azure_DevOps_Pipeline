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
  
  # Yeh lines add karo OIDC ke liye
  use_oidc = true
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
}
