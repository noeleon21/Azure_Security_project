# Create virtual machine
resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
  name                  = "LinuxVM"
  location              = azurerm_resource_group.azure_security_rg.location
  resource_group_name   = azurerm_resource_group.azure_security_rg.name
  network_interface_ids = [azurerm_network_interface.network_interface.id]
  size                  = "Standard_B1s"
  custom_data = base64encode(file("install_webserver.sh"))
  admin_username = var.username

admin_ssh_key {
  username   = var.username
  public_key = var.ssh_public_key
}
  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }


}

variable "ssh_public_key" {
    description = "SSH public key for VM access"
    type        = string
   
}

variable "username" {   
    description = "Username for the VM"
    type        = string
  
}
