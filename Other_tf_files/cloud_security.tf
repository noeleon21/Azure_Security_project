# resource "azurerm_security_center_subscription_pricing" "mdc_arm" {
#   tier          = "Free"
#   resource_type = "Arm"
#   subplan       = "PerApiCall"
# }

# resource "azurerm_security_center_subscription_pricing" "mdc_servers" {
#   tier          = "Free"
#   resource_type = "VirtualMachines"
#   subplan       = "P2"
# }

# resource "azurerm_security_center_subscription_pricing" "mdc_cspm" {
#   tier          = "Free"
#   resource_type = "CloudPosture"
# }

# resource "azurerm_security_center_subscription_pricing" "mdc_storage" {
#   tier          = "Free"
#   resource_type = "StorageAccounts"
#   subplan       = "DefenderForStorageV2"
# }