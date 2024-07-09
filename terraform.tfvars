// terraform.tfvars
humber_id = "n01581401"
location  = "Canada Central"
resource_group_name = "n01581401-RG"
admin_username      = "n01581401"
admin_password      = "n01581401@humber"
public_key_path     = "/home/n01581401/.ssh/id_rsa.pub"
private_key_path    = "/home/n01581401/.ssh/id_rsa"
tags = {
  environment = "dev"
}
windows_admin_username = "n01581401"
windows_admin_password = "n01581401@humber"
linux_vm_nics= {
    vm1 = "nic-id-1"
    vm2 = "nic-id-2"
    vm3 = "nic-id-3"
  }
linux_vm_names = ["linux-vm1", "linux-vm2", "linux-vm3"]
