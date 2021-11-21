variable "example_var" {
    type        = string
    default     = ""
    description = "description"
}

variable "project_name" {
    type        = string
    validation {
        condition = length(var.project_name) > 5
        error_message = "El nombre es muy corto."
    }
}

locals{
    example_local  = azurerm_resource_group.example.name
    example_local_id = azurerm_resource_group.example.id
    tag = "It's an example"
}

