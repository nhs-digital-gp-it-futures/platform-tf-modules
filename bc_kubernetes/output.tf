output "aks_name" {
    description = "The new Kubernetes Cluster name"
    value = azurerm_kubernetes_cluster.aks.name
    sensitive   = false
}
