# resource "azurerm_subnet" "azurerm_subnet" {
#   name                 = "AzureFirewallSubnet"
#   resource_group_name  = azurerm_resource_group.azure_security_rg.name
#   virtual_network_name = azurerm_virtual_network.azure_security_vnet.name
#   address_prefixes     = ["10.0.1.0/24"]
# }

# resource "azurerm_public_ip" "azure_identity_public_ip" {
#   name                = "testpip"
#   location            = azurerm_resource_group.azure_security_rg.location
#   resource_group_name = azurerm_resource_group.azure_security_rg.name
#   allocation_method   = "Static"
#   sku                 = "Standard"
# }

# resource "azurerm_firewall" "azure_identity_firewall" {
#   name                = "testfirewall"
#   location            = azurerm_resource_group.azure_security_rg.location
#   resource_group_name = azurerm_resource_group.azure_security_rg.name
#   sku_name            = "AZFW_VNet"
#   sku_tier            = "Standard"

#   ip_configuration {
#     name                 = "configuration"
#     subnet_id            = azurerm_subnet.azurerm_subnet.id
#     public_ip_address_id = azurerm_public_ip.azure_identity_public_ip.id
#   }
# }