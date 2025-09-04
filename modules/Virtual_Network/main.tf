resource "azurerm_virtual_network" "vnet" {
    name = var.vnet_name
  resource_group_name = var.rg_name
  location = var.location
  address_space = ["10.0.0.0/16"]
  
}


resource "azurerm_subnet" "subnet" {
  name = var.subnet
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.1.0/24"]
depends_on = [azurerm_virtual_network.vnet]
  
}
