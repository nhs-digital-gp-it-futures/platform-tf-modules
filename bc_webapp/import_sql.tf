### Can't automate due to DBs not being created by Terraform

# data "azurerm_sql_server" "sql_server" {
#   name                = "${var.project}-${var.environment}-sql-pri"
#   resource_group_name = "${var.project}-${var.environment}-rg-sql-pri"
# }

# data "azurerm_sql_database" "sql_db1" {
#   name                = "bc-${var.environment}-bapi"
#   server_name         = data.azurerm_sql_server.sql_server.name
#   resource_group_name = data.azurerm_sql_server.sql_server.resource_group_name
# }

# data "azurerm_sql_database" "sql_db2" {
#   name                = "bc-${var.environment}-isapi"
#   server_name         = data.azurerm_sql_server.sql_server.name
#   resource_group_name = data.azurerm_sql_server.sql_server.resource_group_name
# }