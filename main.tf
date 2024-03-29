# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">2.0.0"
    }
  }
}



# Configure the Microsoft Azure Provider test
provider "azurerm" {
  features {}
  
  }


# Create a resource group
resource "azurerm_resource_group" "RGAppDev" {
  name     = "mossy-AppDev"
  location = "eastus"
}

 # TBD still ned to figure out addressing spaces and stuff

# Create a virtual network within the resour_1.1.0.0.-16ce group
resource "azurerm_virtual_network" "EUS-VNET" {  #_10_1_0_0_16
  name                = "EUS-VNET-10-1-0-0-16"
  resource_group_name = azurerm_resource_group.RGAppDev.name
  location            = azurerm_resource_group.RGAppDev.location
  address_space       = ["10.1.0.0/16"]
}
  
  # create subnet configs
  
  resource "azurerm_subnet" "EUS_Subnet1" {
    name                 = "EUS_Subnet_10_1_1_0_24"
    resource_group_name  = azurerm_resource_group.RGAppDev.name
    virtual_network_name = azurerm_virtual_network.EUS-VNET.name
    address_prefixes     = ["10.1.1.0/24"]

  }

resource "azurerm_subnet" "EUS_Subnet2" {
    name                 = "EUS_Subnet_10_1_2_0_24"
    resource_group_name  = azurerm_resource_group.RGAppDev.name
    virtual_network_name = azurerm_virtual_network.EUS-VNET.name
    address_prefixes     = ["10.1.2.0/24"]

  }

# Create a virtual network 2 within the resour_1.1.0.0.-16ce group
resource "azurerm_virtual_network" "EUS-VNET-10-2-0-0-16" {  #_10_2_0_0_16
  name                = "EUS-VNET-10-2-0-0-16"
  resource_group_name = azurerm_resource_group.RGAppDev.name
  location            = azurerm_resource_group.RGAppDev.location
  address_space       = ["10.2.0.0/16"]
}
  
  # create VNET2 subnet configs
  
  resource "azurerm_subnet" "EUS_Subnet3" {
    name                 = "EUS_Subnet_10_2_1_0_24"
    resource_group_name  = azurerm_resource_group.RGAppDev.name
    virtual_network_name = azurerm_virtual_network.EUS-VNET-10-2-0-0-16.name
    address_prefixes     = ["10.2.1.0/24"]
}

# peering code





# virtual machines
/*
# Virtual machine 1 in Vnet 1
resource "azurerm_network_interface" "example-nic1" {
name = "example-nic1"
location = azurerm_resource_group.RGAppDev.location
resource_group_name = azurerm_resource_group.RGAppDev.name

ip_configuration {
name = "example-ipconfig1"
subnet_id = azurerm_subnet.EUS_Subnet1.id
private_ip_address_allocation = "Dynamic"
}
}

resource "azurerm_linux_virtual_machine" "example-VNET1-VM1" {
name = "example-vm-VNET1-VM1"
location = azurerm_resource_group.RGAppDev.location
resource_group_name = azurerm_resource_group.RGAppDev.name
size = "Standard_B1s"
admin_username = "mmossburg"
admin_password = "TestPassword33#"
disable_password_authentication = false
network_interface_ids = [azurerm_network_interface.example-nic1.id]


#admin_ssh_key {
#username = "mmossburg"
#admin_password = "TestPassword33#"
# public_key = file("~/.ssh/id_rsa.pub")
#}


source_image_reference {
publisher = "Canonical"
offer = "UbuntuServer"
sku = "18.04-LTS"
version = "latest"
}

os_disk {
name                 = "example-osdisk1"
caching              = "ReadWrite"
storage_account_type = "Premium_LRS" 
}
}


#VM 2 in Vnet 2
resource "azurerm_network_interface" "example-nic2" {
name = "example-nic2"
location = azurerm_resource_group.RGAppDev.location
resource_group_name = azurerm_resource_group.RGAppDev.name

ip_configuration {
name = "example-ipconfig2"
subnet_id = azurerm_subnet.EUS_Subnet3.id
private_ip_address_allocation = "Dynamic"
}
}

resource "azurerm_linux_virtual_machine" "example-VNET2-VM2" {
name = "example-vm-VNET2-VM2"
location = azurerm_resource_group.RGAppDev.location
resource_group_name = azurerm_resource_group.RGAppDev.name
size = "Standard_B1s"
admin_username = "mmossburg"
admin_password = "TestPassword33#"
disable_password_authentication = false
network_interface_ids = [azurerm_network_interface.example-nic2.id]


# admin_ssh_key {
# username = "mmossburg"
# admin_password = "TestPassword33#"
# public_key = file("~/.ssh/id_rsa.pub")
# }


source_image_reference {
publisher = "Canonical"
offer = "UbuntuServer"
sku = "18.04-LTS"
version = "latest"
}

os_disk {
name                 = "example-osdisk2"
caching              = "ReadWrite"
storage_account_type = "Premium_LRS" 
}
}

*/



