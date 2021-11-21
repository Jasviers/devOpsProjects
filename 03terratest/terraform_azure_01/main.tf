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

resource "azurerm_resource_group" "examples"{
  count = 3
  name = "multiple_examples_${count.index}"
  location = "West Europe"
}

resource "azurerm_resource_group" "example"{
  name = var.project_name
  location = "West Europe"
}

resource "azurerm_resource_group" "example_2"{
  name = "${var.project_name}_2"
  location = "West Europe"
  tags = {
    dependency = azurerm_resource_group.example.name
    "dependency_id" = local.example_local_id
  }
}

resource "azurerm_resource_group" "example_3"{
    name = "${var.project_name}_3"
    location = "West Europe"
    depends_on = [
      azurerm_resource_group.example
    ]
}

output "output_example_id"{
    value = azurerm_resource_group.example.id
}

output "output_example_name"{
    value = azurerm_resource_group.example.name
}