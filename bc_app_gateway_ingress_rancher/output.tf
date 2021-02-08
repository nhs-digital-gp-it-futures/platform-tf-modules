output "appgw_name" {
    description = "The Application Gateway Name"
    value = azurerm_application_gateway.AppGw.name
    sensitive   = false
}

output "appgw_pip_fqdn" {
    description = "The Application Gateway Public Name"
    value = azurerm_public_ip.PipAppGw.fqdn
}

output "site_URL" {
    value = var.core_url
}

output "rancher_URL" {
    value = join(".", ["rancher-${var.environment}", trim(var.core_url, "${var.environment}.")])
}
