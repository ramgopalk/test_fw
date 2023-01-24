resource "azurerm_availability_set" "fgt_aset" {
  name                        = "fgt_aset"
  location                    = var.location
  resource_group_name         = var.resourcegroup
  platform_fault_domain_count = 2

  #   tags = {
  #     environment = "Production"
  #   }
}
