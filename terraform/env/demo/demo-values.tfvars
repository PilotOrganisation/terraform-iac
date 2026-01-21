env_prefix             = "demo"
resource_group_name    = "nginx-rg"
location               = "Central India"
vnet_name              = "nginx-vnet"
subnet_name            = "nginx-subnet"
vm_name                = "nginx-vm"
vm_size                = "Standard_B2ats_v2"
vm_admin_username      = "azureuser"
public_ip_name         = "nginx-pip"
network_interface_name = "nginx-nic"
tags = {
  deployed_by = "terraform",
  owner       = "github",
  environment = "demo"
}