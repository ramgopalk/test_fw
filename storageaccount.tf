
resource "azurerm_storage_account" "storageaccount" {
  name                     = var.storageaccount
  resource_group_name      = var.resourcegroup
  location                 = var.location
  account_replication_type = "LRS"
  account_tier             = "Standard"

#   tags = {
#     environment = "Terraform Demo"
#   }
}

# resource "random_id" "randomId" {
#   keepers = {
#     resource_group = var.resourcegroup.name
#   }

#   byte_length = 8
# }

resource "azurerm_storage_container" "container" {
  name                  = "mycontainer"
  storage_account_name  = azurerm_storage_account.storageaccount.name
  container_access_type = "private"
}
