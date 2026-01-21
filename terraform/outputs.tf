# output "resource_group_name" {
#   value = var.resource_group_name
# }

# output "location" {
#   value = var.location
# }

# output "vnet_name" {
#   value = var.vnet_name
# }

# output "subnet_name" {
#   value = var.subnet_name
# }

# output "vm_name" {
#   value = var.vm_name
# }

# output "vm_size" {
#   value = var.vm_size
# }

# output "vm_admin_username" {
#   value = var.vm_admin_username
# }

output "access_message" {
  value = "Nginx application is accessible at http://${azurerm_public_ip.pip.ip_address}"
}