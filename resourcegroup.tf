# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "nagios_resourcegroup" {
    name     = "nagios_ResourceGroup"
    location = "northeurope"

    tags {
        environment = "NAGIOS"
    }
}
