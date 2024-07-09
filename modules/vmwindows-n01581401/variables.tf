variable "humber_id" {
  description = "The Humber ID to be used for naming resources"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "storage_account_uri" {
  description = "The URI of the storage account for boot diagnostics"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the Windows VMs"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the Windows VMs"
  type        = string
  sensitive   = true
}

variable "windows_vm_count" {
  description = "The number of Windows VMs to create"
  type        = number
  default     = 1
}

variable "windows_vm_size" {
  description = "The size of the Windows VMs"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "windows_avs_name" {
  type        = string
  description = "Name of the Windows Availability Set"
}

# variable "log_analytics_workspace_id" {
#   description = "The ID of the Log Analytics Workspace for diagnostics"
#   type        = string
# }

variable "tags" {
  description = "A map of tags to be applied to the resources"
  type        = map(string)
}
# variable "log_analytics_workspace_id" {
#   description = "The ID of the Log Analytics Workspace for diagnostics"
#   type        = string
# }


