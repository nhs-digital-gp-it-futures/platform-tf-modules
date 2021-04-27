resource "azurerm_app_service_plan" "webapp_sp" {
  name                = "${var.webapp_name}-service-plan"
  location            = var.region
  resource_group_name = var.rg_name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }

  tags                      = {
    environment             = var.environment
  }
}

resource "azurerm_app_service" "webapp" {
  name                = var.webapp_name
  location            = var.region
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_app_service_plan.webapp_sp.id
  
  app_settings = {
    # Main Settings
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    # Settings for Container Registy  
    DOCKER_REGISTRY_SERVER_URL          = "https://${data.azurerm_container_registry.acr.login_server}"
    DOCKER_REGISTRY_SERVER_USERNAME     = data.azurerm_container_registry.acr.admin_username
    DOCKER_REGISTRY_SERVER_PASSWORD     = var.acr_pwd
    # Settings for sql
    BC_DB_CONNECTION                    = "Server=tcp:${data.azurerm_sql_server.sql_server.fqdn},1433;Initial Catalog=${var.db_name}-bapi;Persist Security Info=False;User ID=${data.azurerm_sql_server.sql_server.administrator_login};Password=${var.auth_pwd};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
    ID_DB_CONNECTION                    = "Server=tcp:${data.azurerm_sql_server.sql_server.fqdn},1433;Initial Catalog=${var.db_name}-isapi;Persist Security Info=False;User ID=${data.azurerm_sql_server.sql_server.administrator_login};Password=${var.auth_pwd};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
  # Configure Docker Image to load on start
  site_config {
    linux_fx_version          = "DOCKER|${data.azurerm_container_registry.acr.login_server}/${var.repository_name}:latest"
    use_32_bit_worker_process = true
    always_on        = var.always_on
    min_tls_version  = "1.2"
  }
  identity {
    type = "SystemAssigned"
  }
  
  tags                      = {
    environment             = var.environment
  }

  lifecycle {
    ignore_changes = [
      app_settings,
      site_config
    ]
  }
}
