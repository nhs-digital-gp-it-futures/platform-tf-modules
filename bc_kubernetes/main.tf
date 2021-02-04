resource "azurerm_kubernetes_cluster" "aks" {
  name                            = "${var.ag_name_fragment}-aks"
  resource_group_name             = var.rg_name
  kubernetes_version              = var.aks_version
  location                        = var.region
  dns_prefix                      = var.aks_dns_prefix
  node_resource_group             = "${var.ag_name_fragment}-rg-aks-nodes"
  sku_tier                        = var.aks_sku_tier

  default_node_pool {
    name                          = var.aks_nodepool
    vm_size                       = var.aks_vmsize
    vnet_subnet_id                = var.aks_subnet_id
    type                          = "VirtualMachineScaleSets"
    enable_auto_scaling           = "true"
    max_pods                      = 110
    max_count                     = var.aks_max_nodes
    min_count                     = var.aks_min_nodes
    node_count                    = var.aks_init_nodes
    availability_zones            = [1,2,3]
    tags = {
      environment                 = var.environment
    }
  }

  # azure_policy {
  #   enabled = "true"
  # }

  service_principal {
    client_id                     = var.spn_id
    client_secret                 = var.spn_secret
  }

  network_profile {
    load_balancer_sku             = "standard"
    network_plugin                = "azure"
    network_policy                = "azure"
    service_cidr                  = "${var.subnet_prefix}.128.0/24"
    docker_bridge_cidr            = "${var.subnet_prefix}.129.1/24"
    dns_service_ip                = "${var.subnet_prefix}.128.111"
  }

  addon_profile {
    kube_dashboard {
      enabled                     = true
    }

    oms_agent {
      enabled                     = false
    }

    http_application_routing {
      enabled                     = false
    }
  }

  api_server_authorized_ip_ranges = var.ip_rules

  enable_pod_security_policy      = "false"

  role_based_access_control {
    enabled                       = "true"
  }

  # ### May be needed for key vault integration ###
  # identity {
  #   type = "SystemAssigned"
  # } 

  tags = {
    environment                   = var.environment
  }

lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count
    ]
  }
}
