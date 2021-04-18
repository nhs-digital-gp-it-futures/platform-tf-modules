output "webapp_name" {
    description = "The new Web App name"
    value = azurerm_app_service.webapp.name
    sensitive   = false
}
