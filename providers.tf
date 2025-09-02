terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "prod-tfstate-rg"
    storage_account_name = "prodstg006"
    container_name       = "tfstatefile"
    key                  = "terraform.tfstate"
    # subscription_id, tenant_id, client_id yahan mat daalo
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
}
