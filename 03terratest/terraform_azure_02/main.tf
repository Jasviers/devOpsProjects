terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.84.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "group" {
  name     = "network_resource_group"
  location = "West Europe"
}

resource "azurerm_virtual_network" "network" {
  name                = "virtualNetwork1"
  location            = azurerm_resource_group.group.location
  resource_group_name = azurerm_resource_group.group.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  tags = {
    environment = "Production"
  }
}