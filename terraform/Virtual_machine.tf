# Create virtual machine
resource "azurerm_windows_virtual_machine" "my_terraform_vm" {
  name                  = "WindowsVM"
  location              = azurerm_resource_group.azure_security_rg.location
  resource_group_name   = azurerm_resource_group.azure_security_rg.name
  network_interface_ids = [azurerm_network_interface.network_interface.id]
  size                  = "Standard_B1s"

  admin_username = "localadmin"
  admin_password = random_password.vm_password.result  # auto-generated, never typed

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

  identity {
    type = "SystemAssigned"  # enables AAD login
  }
}

# Auto-generate a strong password — no var needed
resource "random_password" "vm_password" {
  length           = 32
  special          = true
  min_upper        = 2
  min_lower        = 2
  min_numeric      = 2
  min_special      = 2
}

# Lock it away in Key Vault — break-glass only
resource "azurerm_key_vault_secret" "vm_password" {
  name         = "vm-local-admin-password"
  value        = random_password.vm_password.result
  key_vault_id = azurerm_key_vault.kv.id
}

# AAD login extension — use this for day-to-day access
resource "azurerm_virtual_machine_extension" "aad_login" {
  name                 = "AADLoginForWindows"
  virtual_machine_id   = azurerm_windows_virtual_machine.my_terraform_vm.id
  publisher            = "Microsoft.Azure.ActiveDirectory"
  type                 = "AADLoginForWindows"
  type_handler_version = "2.0"
}

#