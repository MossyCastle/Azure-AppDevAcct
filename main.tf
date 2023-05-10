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

/*  TBD still ned to figure out addressing spaces and stuff

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
 */ 
  
