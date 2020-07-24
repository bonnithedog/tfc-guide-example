




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
    resource_group_name = "azurerm_resource_group.nagios_resourcegroup.name"

    tags {
        environment = "NAGIOS"
    }
}

# Create subnet
resource "azurerm_subnet" "nagios_subnet" {
    name                 = "nagios_subnet"
    resource_group_name  = "azurerm_resource_group.nagios_resourcegroup.name"
    virtual_network_name = "azurerm_virtual_network.nagios_vnet.name"
    address_prefix       = "16.180.0.0/24"
}



# Create Network Security Group and rule
resource "azurerm_network_security_group" "nagios_sg" {
    name                = "nagios_sg"
    location            = "northeurope"
    resource_group_name = "azurerm_resource_group.nagios_resourcegroup.name"

    

    
    
    
   security_rule {
       name                       = "ssh"
       priority                   = 1001
       direction                  = "Inbound"
       access                     = "Allow"
       protocol                   = "Tcp"
       source_port_range          = "*"
       destination_port_range     = "22"
       source_address_prefix      = "var.ADMdefault"
       destination_address_prefix = "*"
   }
   
     security_rule {
     name                       = "http"
     priority                   = 1002
     direction                  = "Inbound"
     access                     = "Allow"
     protocol                   = "Tcp"
     source_port_range          = "*"
     destination_port_range     = "80"
     source_address_prefix      = "var.ADMdefault"
     destination_address_prefix = "*"
 }
  
         security_rule {
     name                       = "https"
     priority                   = 1003
     direction                  = "Inbound"
     access                     = "Allow"
     protocol                   = "Tcp"
     source_port_range          = "*"
     destination_port_range     = "443"
     source_address_prefix      = "*"
     destination_address_prefix = "*"
 }
    
    
#  Server DB Test i Azure
#   security_rule {
#       name                       = "ssh2"
#       priority                   = 1004
#       direction                  = "Inbound"
#       access                     = "Allow"
#       protocol                   = "Tcp"
#       source_port_range          = "*"
#       destination_port_range     = "22"
#       source_address_prefix      = "137.135.209.69"
#       destination_address_prefix = "*"
#   }
   
     security_rule {
     name                       = "http2"
     priority                   = 1005
     direction                  = "Inbound"
     access                     = "Allow"
     protocol                   = "Tcp"
     source_port_range          = "*"
     destination_port_range     = "80"
       source_address_prefix      = "137.135.209.69"
     destination_address_prefix = "*"
 }
  
         security_rule {
     name                       = "https2"
     priority                   = 1006
     direction                  = "Inbound"
     access                     = "Allow"
     protocol                   = "Tcp"
     source_port_range          = "*"
     destination_port_range     = "443"
       source_address_prefix      = "137.135.209.69"
     destination_address_prefix = "*"
 }
 
    
        security_rule {
        name                       = "NRPE"
        priority                   = 1007
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5666"
        source_address_prefix      = "137.135.209.69"
        destination_address_prefix = "*"
        
       
    
    
    }
    
        security_rule {
        name                       = "NSCA"
        priority                   = 1008
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5666"
        source_address_prefix      = "137.135.209.69"
        destination_address_prefix = "*"
        
       
    }
      
      
      
    
    
        security_rule {
        name                       = "NCPA"
        priority                   = 1009
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5693"
        source_address_prefix      = "137.135.209.69"
        destination_address_prefix = "*"
        
       
    }
    
#  Production Matmerk DB at Itas

    security_rule {
     name                       = "httpProd"
     priority                   = 1010
     direction                  = "Inbound"
     access                     = "Allow"
     protocol                   = "Tcp"
     source_port_range          = "*"
     destination_port_range     = "80"
       source_address_prefix      = "213.52.48.36"
     destination_address_prefix = "*"
 }
  
         security_rule {
     name                       = "httpsProd"
     priority                   = 1011
     direction                  = "Inbound"
     access                     = "Allow"
     protocol                   = "Tcp"
     source_port_range          = "*"
     destination_port_range     = "443"
       source_address_prefix      = "213.52.48.36"
     destination_address_prefix = "*"
 }
 
    
        security_rule {
        name                       = "NRPE-Prod"
        priority                   = 1012
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5666"
        source_address_prefix      = "213.52.48.36"
        destination_address_prefix = "*"
        
       
    
    
    }
    
        security_rule {
        name                       = "NSCA-Prod"
        priority                   = 1013
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5666"
        source_address_prefix      = "213.52.48.36"
        destination_address_prefix = "*"
        
       
    }
      
      
        security_rule {
        name                       = "NCPA-Prod"
        priority                   = 1014
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5693"
        source_address_prefix      = "213.52.48.36"
        destination_address_prefix = "*"
        
       
    }
    
    
    tags {
        environment = "NAGIOS"
    }
}
