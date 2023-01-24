
//public ip

resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip
  resource_group_name = var.resourcegroup
  location            = var.location
  allocation_method   = "Static"


}

# resource "azurerm_public_ip_prefix" "example" {
#   name                = "acceptanceTestPublicIpPrefix1"
#   location            = var.location
#   resource_group_name = var.resourcegroup

#   prefix_length = 31


# }
