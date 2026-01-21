terraform {
  required_version = ">= 1.3"

  backend "azurerm" {
    resource_group_name  = "terraform-iac-poc-tfstate-rg"
    storage_account_name = "terraformiacpoctfstatesa"
    container_name       = "tfstatecontainer"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}
provider "azurerm" {
  subscription_id = "f805bc8d-1c98-4d3b-85d2-f2adea26cb5b"
  features {}
}
