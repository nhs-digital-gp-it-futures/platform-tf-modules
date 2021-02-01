output "sql_bapi_pri_name" {
    description = "The primary DB name for bapi private"
    value = azurerm_sql_database.sql_bapi_pri.name
    sensitive   = false
}

output "sql_bapi_pub_name" {
    description = "The primary DB name for bapi public"
    value = azurerm_sql_database.sql_bapi_pub.name
    sensitive   = false
}

output "sql_isapi_pub_name" {
    description = "The primary DB name for isapi public"
    value = azurerm_sql_database.sql_isapi_pub.name
    sensitive   = false
}

output "sql_ordapi_pub_name" {
    description = "The primary DB name for ordapi public"
    value = azurerm_sql_database.sql_ordapi_pub.name
    sensitive   = false
}
