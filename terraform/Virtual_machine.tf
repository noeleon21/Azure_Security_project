# Create virtual machine
resource "azurerm_windows_virtual_machine" "my_terraform_vm" {
  name                  = "WindowsVM"
  location              = azurerm_resource_group.azure_security_rg.location
  resource_group_name   = azurerm_resource_group.azure_security_rg.name
  network_interface_ids = [azurerm_network_interface.network_interface.id]
  size                  = "Standard_B1s"  # Free tier eligible size

  admin_username = var.username
  admin_password = var.admin_password

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

variable "username" {
  description = "Username for the Windows VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the Windows VM"
  type        = string
  sensitive   = true
}