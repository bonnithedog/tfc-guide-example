# Create a resource group
resource "azurerm_resource_group" "rg001a" {
  name     = "example-resources"
  location = "northeurope"
}
