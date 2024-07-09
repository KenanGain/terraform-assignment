module "resource_group" {
  source              = "./modules/rgroup-n01581401"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

module "network" {
  source              = "./modules/network-n01581401"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on          = [module.resource_group]
   tags = var.tags
}

module "common" {
  source              = "./modules/common-n01581401"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on          = [module.resource_group]
  tags = var.tags
}

module "vmlinux" {
  source                = "./modules/vmlinux-n01581401"
  humber_id             = var.humber_id
  location              = var.location
  resource_group_name   = module.resource_group.resource_group_name
  subnet_id             = module.network.subnet_id
  storage_account_uri   = module.common.storage_account_uri
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  public_key_path       = var.public_key_path
  private_key_path      = var.private_key_path
  tags                  = var.tags
  linux_vm_names        = var.linux_vm_names
  linux_vm_size         = var.linux_vm_size
  linux_vm_nics         = var.linux_vm_nics
  availability_set_name = "${var.humber_id}-avs"
  depends_on            = [module.network, module.common]
}

module "vmwindows" {
  source              = "./modules/vmwindows-n01581401"
  humber_id           = var.humber_id
  location            = var.location
  windows_avs_name    = local.windows_avs_name
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.network.subnet_id
  storage_account_uri = module.common.storage_account_uri
  admin_username      = var.windows_admin_username
  admin_password      = var.windows_admin_password
  windows_vm_count    = var.windows_vm_count
  windows_vm_size     = var.windows_vm_size
  tags                = var.tags
  depends_on          = [module.network, module.common]
}


locals {
  windows_avs_name = "windows-avs-${var.humber_id}"
}


module "loadbalancer" {
  source                    = "./modules/loadbalancer-n01581401"
   resource_group_name       = module.resource_group.resource_group_name
  location                  = var.location
  tags                      = var.tags
  depends_on                = [module.vmlinux]
}

module "datadisk" {
  source              = "./modules/datadisk-n01581401"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  linux_vm_ids        = values(module.vmlinux.linux_vm_ids)
  windows_vm_ids      = tolist(module.vmwindows.windows_vm_ids)
  depends_on          = [module.vmlinux, module.vmwindows]
}

module "database" {
  source                  = "./modules/database-n01581401"
  humber_id               = var.humber_id
  location                = var.location
  resource_group_name     = module.resource_group.resource_group_name
  admin_username          = var.admin_username
  admin_password          = var.admin_password
  tags                    = var.tags
  postgresql_version      = var.postgresql_version
  ssl_enforcement_enabled = var.ssl_enforcement_enabled
  depends_on              = [module.common]
}

