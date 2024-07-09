output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "log_analytics_workspace_name" {
  value = module.common.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  value = module.common.recovery_services_vault_name
}

output "storage_account_name" {
  value = module.common.storage_account_name
}

output "linux_vm_hostnames" {
  value = module.vmlinux.vm_hostnames
}

output "linux_vm_fqdns" {
  value = module.vmlinux.public_ip_fqdns
}

output "linux_vm_private_ip_addresses" {
  value = module.vmlinux.private_ip_addresses
}

output "linux_vm_public_ip_addresses" {
  value = module.vmlinux.public_ip_addresses
}

output "windows_vm_hostnames" {
  value = module.vmwindows.windows_vm_hostnames
}

output "windows_vm_fqdns" {
  value = module.vmwindows.windows_vm_fqdns
}

output "windows_vm_private_ip_addresses" {
  value = module.vmwindows.windows_private_ip_addresses
}

output "windows_vm_public_ip_addresses" {
  value = module.vmwindows.windows_public_ip_addresses
}

output "windows_vm_ids" {
  value = module.vmwindows.vm_ids
}

output "load_balancer_name" {
  value = module.loadbalancer.load_balancer_name
}

output "linux_vm_ids" {
  value = module.vmlinux.linux_vm_ids
}

output "public_ip_ids" {
  value = module.vmlinux.public_ip_ids
}

output "nic_ids" {
  value = module.vmlinux.nic_ids
}
