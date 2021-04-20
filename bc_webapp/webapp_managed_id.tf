# resource "azurerm_role_assignment" "managed_AAD_Access" {
#   scope                = azurerm_user_assigned_identity.managed_id.id
#   role_definition_name = "Managed Identity Operator"
#   principal_id         = azurerm_user_assigned_identity.managed_id.principal_id
# }
