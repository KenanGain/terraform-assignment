// modules/vmlinux/outputs.tf 


output "vm_ids" {
  description = "The IDs of the Linux VMs"
  value       = [for vm in azurerm_linux_virtual_machine.linux_vm : vm.id]
}




output "vm_public_ips" {
  value = { for vm in azurerm_linux_virtual_machine.linux_vm : vm.name => vm.public_ip_address }
}
output "linux_vm_ids" {
  value = { for k, v in azurerm_linux_virtual_machine.linux_vm : k => v.id }
}

output "nic_ids" {
  value = { for k, v in azurerm_network_interface.linux_nic : k => v.id }
}

output "public_ip_fqdns" {
  value = { for k, v in azurerm_public_ip.linux_pip : k => v.fqdn }
}

output "public_ip_ids" {
  value = { for k, v in azurerm_public_ip.linux_pip : k => v.id }
}

output "vm_hostnames" {
  value = { for k, v in azurerm_linux_virtual_machine.linux_vm : k => v.computer_name }
}

output "private_ip_addresses" {
  value = { for k, v in azurerm_network_interface.linux_nic : k => v.ip_configuration[0].private_ip_address }
}

output "public_ip_addresses" {
  value = { for k, v in azurerm_public_ip.linux_pip : k => v.ip_address }
}