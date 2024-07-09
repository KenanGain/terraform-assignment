resource "azurerm_resource_group" "main" {
    name = "${var.humber_id}-RG"
    location = var.location
    tags = var.tags

}