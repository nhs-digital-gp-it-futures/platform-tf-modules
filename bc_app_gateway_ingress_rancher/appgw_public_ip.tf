resource "azurerm_public_ip" "PipAppGw" {
  name                = var.pip_name
  location            = var.region
  domain_name_label   = var.dns_name
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    environment       = var.environment
  }
}

# resource "azurerm_public_ip" "PipAppGwPri" {
#   count               = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0
  
#   name                = "${var.project}-${var.environment}-pip-pri"
#   location            = var.region
#   domain_name_label   = "buyingcatalogue${local.shortenv}pri"
#   resource_group_name = azurerm_resource_group.appgw.name
#   allocation_method   = "Static"
#   sku                 = "Standard"

#   tags = {
#     environment       = var.environment
#   }
# }