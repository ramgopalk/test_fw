
provider "azurerm" {
  features {}
  azurerm_resource_group {
     prevent_deletion_if_contains_resources = false

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
}

# //provider
# terraform {
# required_providers {
# fortios = {
# source = "fortinetdev/fortios"
# }
# }
# }


// Resource Group

resource "azurerm_resource_group" "resourcegroup" {
  name     = var.resourcegroup
  location = var.location

}
