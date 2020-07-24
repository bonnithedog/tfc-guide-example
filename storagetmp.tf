# Generate random text for a unique storage account name
resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = azurerm_resource_group.rg001a.name
    }

    byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "nagios_storageaccount" {
    name                        = "diag${random_id.randomId.hex}"
    resource_group_name         = azurerm_resource_group.rg001a.name
    location                    = "northeurope"
    account_tier                = "Standard"
    account_replication_type    = "LRS"

   # tags {
   #     environment = "NAGIOS"
   # }
}
