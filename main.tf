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
  
  resource "azurerm_subnet" "EUS_Subnet" {
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
  
  resource "azurerm_subnet" "EUS_Subnet2 " {
    name                 = "EUS_Subnet_10_2_1_0_24"
    resource_group_name  = azurerm_resource_group.RGAppDev.name
    virtual_network_name = azurerm_virtual_network.EUS-VNET.name
    address_prefixes     = ["10.2.1.0/24"]





/* # Dev
script line 1
2
3
4

# prod
script line 1
2
3
4
*/
