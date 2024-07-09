resource "azurerm_network_interface" "linux_nic" {
  for_each = toset(var.linux_vm_names)
  name                = "nic-${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_pip[each.key].id
  }

  tags = var.tags
}
resource "azurerm_public_ip" "linux_pip" {
  for_each = toset(var.linux_vm_names)
  name                = "pip-${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  tags                = var.tags
}


resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each = toset(var.linux_vm_names)
  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.linux_nic[each.key].id]
  size                = var.linux_vm_size
  admin_username      = var.admin_username
  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key_path)
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7_9-gen2"
    version   = "latest"
  }
  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }


  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each            = zipmap(var.linux_vm_names, var.linux_vm_names)
  name                = "NetworkWatcherAgentLinux"
  virtual_machine_id  = azurerm_linux_virtual_machine.linux_vm[each.key].id
  publisher           = "Microsoft.Azure.NetworkWatcher"
  type                = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each            = zipmap(var.linux_vm_names, var.linux_vm_names)
  name                = "AzureMonitorLinuxAgent"
  virtual_machine_id  = azurerm_linux_virtual_machine.linux_vm[each.key].id
  publisher           = "Microsoft.Azure.Monitor"
  type                = "AzureMonitorLinuxAgent"
  type_handler_version = "1.2"
  auto_upgrade_minor_version = true
  tags = var.tags
}

resource "null_resource" "linux_provisioner" {


  for_each = azurerm_public_ip.linux_pip

  provisioner "local-exec" {
    command = "echo  Public IP: ${each.value.ip_address}"
  }

  depends_on = [azurerm_public_ip.linux_pip]
}