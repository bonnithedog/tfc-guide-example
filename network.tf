# Create a virtual network within the resource group
resource "azurerm_virtual_network" "nw001" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.rg001a.name
  location            = azurerm_resource_group.rg001a.location
  address_space       = ["10.0.0.0/16"]
}
