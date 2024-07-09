// outputs.tf
output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.main.name
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = azurerm_subnet.main.name
}

output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "subnet_id" {
  value = azurerm_subnet.main.id
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

