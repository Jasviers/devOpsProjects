terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.84.0"
    }
  }
}

provider "azurerm" {
  alias = "test"
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
}