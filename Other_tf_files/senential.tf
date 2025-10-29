# resource "azurerm_log_analytics_workspace" "log_analytics_workspace_id" {
#   name                = "LOG-ANALYTICS-WORKSPACE"
#   location            = azurerm_resource_group.azure_security_rg.location
#   resource_group_name = azurerm_resource_group.azure_security_rg.name
#   sku                 = "PerGB2018"
# }

# resource "azurerm_sentinel_log_analytics_workspace_onboarding" "log_analytics_workspace_onboarding" {
#   workspace_id = azurerm_log_analytics_workspace.log_analytics_workspace_id.id
# }

# resource "azurerm_sentinel_alert_rule_ms_security_incident" "log_analytics_workspace_onboarding" {
#   name                       = "SENTINEL-ms-security-incident-alert-rule"
#   log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.log_analytics_workspace_onboarding.workspace_id
#   product_filter             = "Microsoft Cloud App Security"
#   display_name               = "example rule"
#   severity_filter            = ["High"]
# }

# module "mdc_defender_plans" {
#   source  = "Azure/mdc-defender-plans-azure/azure"
#   version = "latest"

#   management_group_id = "your_management_group_id"
#   onboarding_type     = "management_group"
#   mdc_plans_list      = ["Servers", "Storage", "Databases"]
# }