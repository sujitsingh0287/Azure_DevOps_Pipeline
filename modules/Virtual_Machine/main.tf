resource "azurerm_network_interface" "nic" {
  name = "${var.vm_name}-nic"
  resource_group_name = var.rg_name
  location = var.location


ip_configuration {
    name = "Internal"
    subnet_id = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    
  
 }
  
}

resource "azurerm_windows_virtual_machine" "vm" {
  name = var.vm_name
  resource_group_name = var.rg_name
  location = var.location
  size = "Standard_B1ms"
  network_interface_ids = [azurerm_network_interface.nic.id]
  admin_username = "myadmin"
  admin_password = "P@ssword"

  os_disk {
    caching = "ReadOnly"
    storage_account_type = "Premium_LRS"
  } 



source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"

}

}

    
    