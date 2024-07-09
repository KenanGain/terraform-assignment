// output.tf
output "resource_group_name" {
    description = "The name of the reource group"
    value = azurerm_resource_group.main.name
}