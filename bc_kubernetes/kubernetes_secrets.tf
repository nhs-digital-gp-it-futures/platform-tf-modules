resource "azurerm_key_vault_secret" "kv_aksusername" {
  name         = "${var.kv_key}username"
  value        = azurerm_kubernetes_cluster.aks.kube_config.0.username
  content_type = "${var.project}-AKS-username"
  key_vault_id = var.kv_id
  
  depends_on = [
    azurerm_kubernetes_cluster.aks
  ] 

  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv_akspassword" {
  name         = "${var.kv_key}password"
  value        = azurerm_kubernetes_cluster.aks.kube_config.0.password
  content_type = "${var.project}-AKS-password"
  key_vault_id = var.kv_id
  
  depends_on = [
    azurerm_kubernetes_cluster.aks
  ] 

  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv_aksclientcert" {
  name         = "${var.kv_key}clientcert"
  value        = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
  content_type = "${var.project}-AKS-client-certificate-(Base64)"
  key_vault_id = var.kv_id
  
  depends_on = [
    azurerm_kubernetes_cluster.aks
  ] 

  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv_aksclientkey" {
  name         = "${var.kv_key}clientkey"
  value        = azurerm_kubernetes_cluster.aks.kube_config.0.client_key
  content_type = "${var.project}-AKS-client-key-(Base64)"
  key_vault_id = var.kv_id
    
  depends_on = [
    azurerm_kubernetes_cluster.aks
  ] 

  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "kv_aksclustercacert" {
  name         = "${var.kv_key}clustercacert"
  value        = azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate
  content_type = "${var.project}-AKS-Cluster-CA-Certificate-(Base64)"
  key_vault_id = var.kv_id
      
  depends_on = [
    azurerm_kubernetes_cluster.aks
  ] 
  
  tags = {
    environment = var.environment
  }
}
