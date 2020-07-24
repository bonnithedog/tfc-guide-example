# Create a resource group
resource "azurerm_resource_group" "rg001a" {
  name     = "rg001a-resources"
  location = "northeurope"
}
