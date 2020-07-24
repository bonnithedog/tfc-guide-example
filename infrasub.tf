




# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "nagios_resourcegroup" {
    name     = "nagios_ResourceGroup"
    location = "northeurope"

    tags {
        environment = "NAGIOS"
    }
}

# Create virtual network
resource "azurerm_virtual_network" "nagios_vnet" {
    name                = "nagios_vnet"
    address_space       = ["16.0.0.0/8"]
    location            = "northeurope"
    resource_group_name = "${azurerm_resource_group.nagios_resourcegroup.name}"

    tags {
        environment = "NAGIOS"
    }
}

# Create subnet
resource "azurerm_subnet" "nagios_subnet" {
    name                 = "nagios_subnet"
    resource_group_name  = "${azurerm_resource_group.nagios_resourcegroup.name}"
    virtual_network_name = "${azurerm_virtual_network.nagios_vnet.name}"
    address_prefix       = "16.180.0.0/24"
}


