resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = "${var.humber_id}-law"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = var.tags
}

resource "azurerm_recovery_services_vault" "recovery_vault" {
  name                = "${var.humber_id}-rsv"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  tags = var.tags
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.humber_id}storage"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

# resource "azurerm_monitor_diagnostic_setting" "storage_account_diag" {
#   name               = "${var.humber_id}-storage-diag"
#   target_resource_id = azurerm_storage_account.storage_account.id
#   log_analytics_workspace_id = var.log_analytics_workspace_id

#   metric {
#     category = "Capacity"
#     enabled  = true
#   }

#   metric {
#     category = "Transaction"
#     enabled  = true
#   }
# }
