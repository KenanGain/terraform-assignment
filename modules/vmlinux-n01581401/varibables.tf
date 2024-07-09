variable "humber_id" {
  description = "The Humber ID for naming the resources"
  type        = string
}

variable "location" {
  description = "The location where the resources will be created"
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
  description = "The admin username for the VMs"
  type        = string
}

variable "admin_password" {
  description = "The admin username for the VMs"
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

variable "linux_vm_size" {
  description = "The size of the Linux VMs"
  type        = string
}

variable "tags" {
  description = "A map of tags to be applied to the resources"
  type        = map(string)
}

variable "linux_vm_names" {
  description = "A map of names for the Linux VMs"
  type        = list(string)
}

variable "linux_vm_nics" {
  description = "The network interface IDs of the Linux VMs"
  type        = map(string)
}

variable "availability_set_name" {
  description = "The name of the availability set"
  type        = string
}
