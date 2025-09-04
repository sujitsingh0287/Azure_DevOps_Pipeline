terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.67.0" # latest stable version use kar
    }
  }

  backend "azurerm" {
    resource_group_name  = "prod-tfstate-rg"
    storage_account_name = "prodstg006"
    container_name       = "tfstatefile"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
}
