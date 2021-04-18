data "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.acr_rg
}

# output "acr" {
#     description = "The new Kubernetes Cluster name"
#     value = azurerm_kubernetes_cluster.aks.name
#     sensitive   = false
# }