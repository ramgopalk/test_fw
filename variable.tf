// Azure configuration
variable "subscription_id" {
  type    = string
  default = "2c27975e-ce4f-421e-82ff-9e5080dc09c5"
} 
variable "client_id" {
  type    = string
  default = "754f5cec-f1a0-4dc0-aa3c-b4cb7a37cd35"
}
variable "client_secret" {
  type    = string
  default = "vHx8Q~3f1tzGUavM4ilsL2~Tc_WDSPEj273MhaSU"
}
variable "tenant_id" {
  type    = string
  default = "421b3bef-502a-4631-9b9b-2cebf650e2fb"
}

variable "fgtvm_name" {
  type    = string
  default = "fortgate_vm"
}

variable "vm_size" {
  type    = string
  default = "Standard_F4"
}

# # // To use custom image
# # // by default is false
# # variable "custom" {
# #   default = false
# # }

# # //  Custom image blob uri
# # variable "customuri" {
# #   type    = string
# #   default = "<custom image blob uri>"
# # }

# # variable "custom_image_name" {
# #   type    = string
# #   default = "<custom image name>"
# # }

# # variable "custom_image_resource_group_name" {
# #   type    = string
# #   default = "<custom image resource group>"
# # }

# License Type to create FortiGate-VM
# Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

variable "publisher" {
  type    = string
  default = "fortinet"
}

variable "fgtoffer" {
  type    = string
  default = "fortinet_fortigate-vm_v5"
}

// BYOL sku: fortinet_fg-vm
// PAYG sku: fortinet_fg-vm_payg_20190624
variable "fgtsku" {
  type    = string
  default = "fortinet_fg-vm_payg_2022"
}

variable "fgtversion" {
  type    = string
  default = "7.2.2"
}

variable "adminusername" {
  type    = string
  default = "azureadmin"
}

variable "adminpassword" {
  type    = string
  default = "Fortinet@123#"
}

variable "location" {
  type    = string
  default = "uk south"
}

variable "vnetcidr" {
  default = "10.1.0.0/16"
}

variable "publiccidr" {
  type    = string
  default = "10.1.0.0/24"
}

variable "privatecidr" {
  type    = string
  default = "10.1.1.0/24"
}

variable "protectedcidr" {
  type    = string
  default = "10.1.1.1/32"
}
# variable "bootstrap-fgtvm" {
#   // Change to your own path
#   type    = string
#   default = "fgtvm.conf"
# }

# // license file for the fgt
# variable "license" {
#   // Change to your own byol license file, license.lic
#   type    = string
#   default = "license.txt"
# }
//vnet
variable "vnet" {
  type    = string
  default = "test_vnet"
}
//resource group
variable "resourcegroup" {
  type    = string
  default = "test-ram"
}

# variable "keyvault" {
#   type    = string
#   default = "fgtkeyvault"
# }

variable "public_ip" {
  type    = string
  default = "fgtfwPublicIP"
}

variable "loadbalancer2" {
  type    = string
  default = "internal-loadbalancer"
}

variable "loadbalancer1" {
  type    = string
  default = "external-loadbalancer"
}


variable "subnet1" {
  type    = string
  default = "publicsubnet"
}

variable "subnet2" {
  type    = string
  default = "privatesubnet"
}

variable "subnet3" {
  type    = string
  default = "protectedsubnet"
}

# variable "publiccidr" {
#   type    = string
#   default = ""
# }

# variable "privatecidr" {
#   type    = string
#   default = ""
# }

# variable "protectedcidr" {
#   type    = string
#   default = "10.0.1.0/24"
# }

# variable "routetable" {
#   type    = string
#   default = "InternalRouteTable1"
# }

variable "storageaccount" {
  type    = string
  default = "fgtstorageaccount"
}

# variable "public_ip" {
#   type    = string
#   default = "Testpublicip"
# }
variable "routetable" {
  type    = string
  default = "fgt_routetable"
}
