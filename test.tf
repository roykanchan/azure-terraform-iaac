terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
       source = "hashicorp/azurerm"
       version = ">= 2.0"
       # version = "~> 2.64.0" - will upgrade only the right most decimal - Prod Usage
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "870164e9-1e9a-4752-88d1-25e89afc8aa0"
}

resource "azurerm_virtual_network" "main" {
   name = "test-network"
   address_space = ["10.0.0.0/16"]
   location = "South Central US"
   resource_group_name = "my_tests"
}

resource "azurerm_subnet" "internal" {
  name = "test1"
  resource_group_name = "my_tests"
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes = ["10.0.2.0/24"]
}