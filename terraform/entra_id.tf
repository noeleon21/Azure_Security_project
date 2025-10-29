resource "azurerm_resource_group" "azure_security_rg" {
  name     = var.resource_group_name
  location = "US East"
}

data "azuread_domains" "primary" {
  only_initial = true
}

locals {
  user_list = jsondecode(file("users.json"))
  user_map = { for user in local.user_list : user.displayName => user  }
}
output "name" {
  value = local.user_map
}

resource "random_password" "password" {
  for_each = local.user_map
  length   = 16
  special  = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azuread_user" "users" {
    for_each = local.user_map
    user_principal_name = each.value.email
    display_name        = each.value.displayName
    mail_nickname       = each.value.mailNickname
    password            = random_password.password[each.key].result
    force_password_change = true
}


resource "azurerm_role_assignment" "example" {
  for_each = azuread_user.users
  scope               = azurerm_linux_virtual_machine.my_terraform_vm.id
  role_definition_name = "Reader"
  principal_id         = each.value.object_id
}

