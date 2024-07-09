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

variable "tags" {
  description = "A map of tags to be applied to the resources"
  type        = map(string)
}
