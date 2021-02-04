variable "environment" {
  type = string
}
variable "project" {
  type = string
}
variable "region" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "ag_name_fragment" {
  type = string
}
variable "aks_version" {
  type = string
}
variable "aks_sku_tier" {
  type = string
}
variable "aks_nodepool" {
  type = string
}
variable "aks_vmsize" {
  type = string
}
variable "aks_init_nodes" {
  type = string
}
variable "aks_max_nodes" {
  type = string
}
variable "aks_min_nodes" {
  type = string
}
variable "aks_subnet_id" {
  type = string
}
variable "subnet_prefix" {
  type = string
}
variable "aks_dns_prefix" {
  type = string
} 
variable "ip_rules" {
  type = list(string)
}
variable "spn_id" {
  type = string
}
variable "spn_secret" {
  type = string
}
variable "kv_id" {
  type = string
}
variable "kv_key" {
  type = string
}
