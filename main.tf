provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.44.0"

  subscription_id = "5f821010-caae-4a0c-b435-0bc6224fea93"

  tenant_id = "147ae4e2-d977-491a-9760-680bc8ce94c9"
}

resource "azurerm_resource_group" "itmanaged" {
  name     = "itmanagerResourceGroup1"
  location = "NorthEurope"

  tags = {
    environment = "Production"
  }
}


