variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "users_json_b64" {
  description = "Base64 encoded JSON array of users to create"
  type        = string
  sensitive   = true
}

locals {
  user_list = jsondecode(base64decode(var.users_json_b64))
  user_map  = { for user in local.user_list : user.displayName => user }
}

data "azuread_domains" "primary" {
  only_initial = true
}

data "azurerm_subscription" "primary" {}

resource "azurerm_resource_group" "azure_security_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_password" "password" {
  for_each         = local.user_map
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azuread_user" "users" {
  for_each              = local.user_map
  user_principal_name   = each.value.email
  display_name          = each.value.displayName
  mail_nickname         = each.value.mailNickname
  password              = random_password.password[each.key].result
  force_password_change = true
}

resource "azurerm_role_definition" "custom_role" {
  name        = "my-custom-role"
  scope       = data.azurerm_subscription.primary.id
  description = "This is a custom role created via Terraform"

  permissions {
    actions = [
      "Microsoft.Compute/*/read",
      "Microsoft.Network/*/read",
      "Microsoft.Resources/*/read"
    ]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id,
  ]
}

resource "azurerm_role_assignment" "example" {
  for_each           = azuread_user.users
  scope              = azurerm_linux_virtual_machine.my_terraform_vm.id
  role_definition_id = azurerm_role_definition.custom_role.role_definition_resource_id
  principal_id       = each.value.object_id
}

resource "azurerm_user_assigned_identity" "github_identity" {
  name                = "github-oidc-identity"
  resource_group_name = azurerm_resource_group.azure_security_rg.name
  location            = azurerm_resource_group.azure_security_rg.location
}

resource "azurerm_federated_identity_credential" "github_oidc" {
  name                = "github_actions"
  resource_group_name = azurerm_resource_group.azure_security_rg.name
  parent_id           = azurerm_user_assigned_identity.github_identity.id
  issuer              = "https://token.actions.githubusercontent.com"
  audience            = ["api://AzureADTokenExchange"]
  subject             = "repo:YOUR_GITHUB_USERNAME/YOUR_REPOSITORY:ref:refs/heads/main"
}

output "user_map" {
  value     = local.user_map
  sensitive = true
}