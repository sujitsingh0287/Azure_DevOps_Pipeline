resource "azurerm_storage_account" "storage_account" {
  depends_on = [ var.rg_name ]
  name = var.dev_stg
  resource_group_name = var.rg_name
  location = var.location
  account_replication_type = "LRS"
  account_tier = "Standard"
  # allow_blob_public_access = false
  # min_tls_version = "TLS1_2"
  


}

resource "azurerm_storage_container" "CN"{
  name                  = "tfstate"
  depends_on = [ azurerm_storage_account.storage_account ]
  storage_account_id    = azurerm_storage_account.storage_account.id
  container_access_type = "private"
}