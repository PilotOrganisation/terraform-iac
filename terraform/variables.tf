variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "nginx-rg"
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "env_prefix" {
  description = "The environment prefix"
  type        = string
  default     = "demo"
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default = {
    environment = "poc"
  }
}
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "nginx-vnet"
}
variable "vnet_cidir" {
  description = "The CIDIR range for the VNET"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "nginx-subnet"
}
variable "subnet_cidir" {
  description = "The CIDIR range for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}
variable "vm_size" {
  description = "The size of the VM"
  type        = string
  default     = "Standard_B1s"
}
variable "vm_name" {
  description = "The name of the VM"
  type        = string
  default     = "nginx-vm"
}
variable "vm_admin_username" {
  description = "The admin username for the VM"
  type        = string
  default     = "azureuser"
}
variable "vm_admin_password" {
  description = "The admin password for the VM"
  type        = string
  default     = ""
}
variable "public_ip_name" {
  description = "The name of the public IP"
  type        = string
  default     = "nginx-pip"
}
variable "network_interface_name" {
  description = "The name of the network interface"
  type        = string
  default     = "nginx-nic"
}