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

variable "admin_username" {
  description = "The admin username for the PostgreSQL server"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the PostgreSQL server"
  type        = string
}

variable "public_key_path" {
  description = "The path to the SSH public key"
  type        = string
}

variable "private_key_path" {
  description = "The path to the SSH private key"
  type        = string
}

variable "vm_size" {
  description = "The size of the VMs"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "linux_vm_size" {
  description = "The size of the Linux VMs"
  default     = "Standard_B1ms"
}

variable "linux_vm_nics" {
  description = "The network interface IDs of the Linux VMs"
  type        = map(string)
}


variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {
    Assignment = "CCGC 5502 Automation Assignment",
    Name = "Kenan.Gain"
    ExpirationDate = "2024-12-31"
    Environment  = "Learning"
  }
}

variable "linux_vm_names" {
  description = "The names of the Linux VMs"
  type        = list(string)
  default     = ["linux-vm1", "linux-vm2", "linux-vm3"]
}

variable "windows_admin_username" {
  description = "The admin username for the Windows VMs"
  type        = string
}

variable "windows_admin_password" {
  description = "The admin password for the Windows VMs"
  type        = string
  sensitive   = true
}

variable "windows_vm_names" {
  description = "The names of the Windows VMs"
  type        = map(string)
  default     = {
    vm1 = "windows-vm1"
  }
}

variable "windows_avs_name" {
  description = "Name of the Windows Availability Set"
  type        = string
  default     = "windows-avs"
}

variable "windows_vm_size" {
  description = "The size of the Windows VMs"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "windows_vm_count" {
  description = "The number of Windows VMs to create"
  type        = number
  default     = 1
}


variable "postgresql_version" {
  description = "The version of PostgreSQL to use"
  default     = "11"
}

variable "ssl_enforcement_enabled" {
  description = "Whether SSL enforcement is enabled"
  default     = true
}

variable "ARM_SUBSCRIPTION_ID" {
  type    = string
  default = ""
}

variable "ARM_CLIENT_ID" {
  type    = string
  default = ""
}

variable "ARM_CLIENT_SECRET" {
  type    = string
  default = ""
}

variable "ARM_TENANT_ID" {
  type    = string
  default = ""
}
