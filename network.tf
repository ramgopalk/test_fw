// Create Virtual Network

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  address_space       = [var.vnetcidr]
  location            = var.location
  resource_group_name = var.resourcegroup

 
}


resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1
  resource_group_name  = var.resourcegroup
  virtual_network_name = var.vnet
  address_prefixes     = [var.publiccidr]
}
resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2
  resource_group_name  = var.resourcegroup
  virtual_network_name = var.vnet
  address_prefixes     = [var.privatecidr]
}

# resource "azurerm_subnet" "subnet3" {
#   name                 = var.subnet3 
#   resource_group_name  = var.resourcegroup
#   virtual_network_name = var.vnet
#   address_prefixes     = [var.protectedcidr]
# }


# //  Network Security Group
resource "azurerm_network_security_group" "publicnetworknsg" {
  name                = "PublicNetworkSecurityGroup"
  location            = var.location
  resource_group_name = var.resourcegroup

  security_rule {
    name                       = "TCP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

 
}

# resource "azurerm_network_security_group" "privatenetworknsg" {
#   name                = "PrivateNetworkSecurityGroup"
#   location            = var.location
#   resource_group_name = var.resourcegroup

#   security_rule {
#     name                       = "All"
#     priority                   = 1001
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "*"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }

resource "azurerm_network_security_rule" "outgoing_public" {
  name                        = "egress"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resourcegroup
  network_security_group_name = azurerm_network_security_group.publicnetworknsg.name
}

# resource "azurerm_network_security_rule" "outgoing_private" {
#   name                        = "egress-private"
#   priority                    = 100
#   direction                   = "Outbound"
#   access                      = "Allow"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = var.resourcegroup
#   network_security_group_name = azurerm_network_security_group.privatenetworknsg.name
# }

# // FGT Network Interface port1
 resource "azurerm_network_interface" "fgtport1" {
  name                 = "fgtport1"
  location             = var.location
  resource_group_name  = var.resourcegroup
  enable_ip_forwarding = true

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    primary                       = true
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

}

resource "azurerm_network_interface" "fgtport2" {
  name                 = "fgtport2"
  location             = var.location
  resource_group_name  = var.resourcegroup
  enable_ip_forwarding = true

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"
  }
 }


# # Connect the security group to the network interfaces
# # resource "azurerm_network_interface_security_group_association" "port1nsg" {
# #   depends_on                = [azurerm_network_interface.fgtport1]
# #   network_interface_id      = azurerm_network_interface.fgtport1.id
# #   network_security_group_id = azurerm_network_security_group.publicnetworknsg.id
# # }

# # resource "azurerm_network_interface_security_group_association" "port2nsg" {
# #   depends_on                = [azurerm_network_interface.fgtport2]
# #   network_interface_id      = azurerm_network_interface.fgtport2.id
# #   network_security_group_id = azurerm_network_security_group.privatenetworknsg.id
# # }
