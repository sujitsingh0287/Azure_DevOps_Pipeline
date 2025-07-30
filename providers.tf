terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "devops-tfstate-rg"            # RG jisme storage account bana hai
    storage_account_name = "devopstfstate123"         # Storage account name (lowercase only)
    container_name       = "tfstate"                  # Blob container jisme state store hoga
    key                  = "terraform.tfstate"        # State file ka naam
  }

}

provider "azurerm" {
  features {}
  subscription_id = "c316f505-7597-4175-b5db-d2949009d506"
}