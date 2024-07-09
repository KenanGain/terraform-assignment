resource "azurerm_lb" "main" {
  name                = "${var.resource_group_name}-lb"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku = "Basic"
}
