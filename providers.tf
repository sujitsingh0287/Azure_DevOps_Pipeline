terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }


  backend "azurerm" {
    resource_group_name  = "RG-TFSTATEFILE-DONNOT-DELETE"
    storage_account_name = "securetfstatefile"
    container_name       = "tfstatefile"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  use_oidc        = true
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
}
