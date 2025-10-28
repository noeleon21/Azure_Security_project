resource "azurerm_resource_group" "azure_security_rg" {
  name     = var.resource_group_name
  location = "US East"
}

# resource "azurerm_network_security_group" "azure_security_nsg" {
#   name                = "azure-security-nsg"
#   location            = azurerm_resource_group.azure_security_rg.location
#   resource_group_name = azurerm_resource_group.azure_security_rg.name
# }

# resource "azurerm_virtual_network" "azure_security_vnet" {
#   name                = "azure-security-vnet"
#   location            = azurerm_resource_group.azure_security_rg.location
#   resource_group_name = azurerm_resource_group.azure_security_rg.name
#   address_space       = ["10.0.0.0/16"]
#   dns_servers         = ["10.0.0.4", "10.0.0.5"]

# }

# resource "azurerm_subnet" "subnet1" {
#   name                 = "subnet1"
#   resource_group_name  = azurerm_resource_group.azure_security_rg.name
#   virtual_network_name = azurerm_virtual_network.azure_security_vnet.name
#   address_prefixes     = ["10.0.1.0/24"]
# }

# resource "azurerm_subnet" "subnet2" {
#   name                 = "subnet2"
#   resource_group_name  = azurerm_resource_group.azure_security_rg.name
#   virtual_network_name = azurerm_virtual_network.azure_security_vnet.name
#   address_prefixes     = ["10.0.2.0/24"]
  
# }

# resource "azurerm_network_interface" "network_interface" {
#   name                = "network-interface"
#   location            = azurerm_resource_group.azure_security_rg.location
#   resource_group_name = azurerm_resource_group.azure_security_rg.name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.subnet1.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

