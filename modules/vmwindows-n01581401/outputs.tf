output "windows_vm_hostnames" {
  value = azurerm_windows_virtual_machine.virtual_machine[*].name
}

output "windows_vm_fqdns" {
  value = azurerm_public_ip.public_ip[*].fqdn
}

output "windows_private_ip_addresses" {
  value = azurerm_network_interface.windows_nic[*].private_ip_address
}

output "windows_public_ip_addresses" {
  value = azurerm_public_ip.public_ip[*].ip_address
}

output "vm_ids" {
  value = azurerm_windows_virtual_machine.virtual_machine[*].id
}

output "windows_vm_ids" {
  value = azurerm_windows_virtual_machine.virtual_machine[*].id
}