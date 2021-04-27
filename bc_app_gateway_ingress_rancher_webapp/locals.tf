locals {
  rancherLiveURL = var.environment == "preprod" ? join(".", ["rancher-${var.environment}", trim(var.core_url, "test.")]) : "rancher-${var.environment}.${var.core_url}"
  rancherURL = var.environment != "preprod" && var.environment != "production" ? join(".", ["rancher-${var.environment}", trim(var.core_url, "${var.environment}.")]) : local.rancherLiveURL
}
