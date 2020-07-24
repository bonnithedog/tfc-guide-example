# Create Network Security Group and rule
resource "azurerm_network_security_group" "nagios_sg" {
    name                = "nagios_sg"
    location            = "northeurope"
    resource_group_name = "${azurerm_resource_group.rg001a.name}"

  
