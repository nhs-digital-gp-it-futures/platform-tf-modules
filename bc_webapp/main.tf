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
    # Settings for Container Registy  
    DOCKER_REGISTRY_SERVER_URL      = "https://${data.azurerm_container_registry.acr.login_server}"
    DOCKER_REGISTRY_SERVER_USERNAME = data.azurerm_container_registry.acr.admin_username
    DOCKER_REGISTRY_SERVER_PASSWORD = data.azurerm_container_registry.acr.admin_password
    # Settings for sql

  }
  # Configure Docker Image to load on start
  site_config {
    linux_fx_version          = "DOCKER|${var.repository_name}:latest"
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
      #site_config
    ]
  }
}
