# Azure Subscription Id
variable "azure-subscription-id" {
  type        = string
  description = "Azure Subscription Id"
}
# Azure Client Id/appId
variable "azure-client-id" {
  type        = string
  description = "Azure Client Id/appId"
}
# Azure Client Id/appId
variable "azure-client-secret" {
  type        = string
  description = "Azure Client Id/appId"
}
# Azure Tenant Id
variable "azure-tenant-id" {
  type        = string
  description = "Azure Tenant Id"
}


#The Cloud-init script path
    variable "CloudinitscriptPath" {  
    type = string
    }
    
    variable "VMAdminName" {  
    type = string
    }
    
    variable "VMAdminPassword" {  
    type = string
    }

    variable "vmsizes" {  
    type = string
    }
    
    
    variable "ADMdefault" {  
    type = string
    }


# Generate random text for a unique storage account name
resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = "${azurerm_resource_group.nagios_resourcegroup.name}"
    }

    byte_length = 8
}


