
# Create public IPs
resource "azurerm_public_ip" "nagios_publicip" {
    name                         = "nagios_PublicIP"
    location                     = "northeurope"
    resource_group_name          = "${azurerm_resource_group.nagios_resourcegroup.name}"
    allocation_method            = "Static"

    tags {
        environment = "NAGIOS"
    }
}


# Create network interface nagios
resource "azurerm_network_interface" "nagios_nic" {
    name                      = "nagios_NIC"
    location                  = "northeurope"
    resource_group_name       = "${azurerm_resource_group.nagios_resourcegroup.name}"
    network_security_group_id = "${azurerm_network_security_group.nagios_sg.id}"

    ip_configuration {
        name                          = "nagios_NICConfiguration"
        subnet_id                     = "${azurerm_subnet.nagios_subnet.id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.nagios_publicip.id}"
    }

    tags {
        environment = "NAGIOS"
    }
}





# Create virtual machine nagios
resource "azurerm_virtual_machine" "nagios" {
    name                  = "nagios"
    location              = "northeurope"
    resource_group_name   = "${azurerm_resource_group.nagios_resourcegroup.name}"
    network_interface_ids = ["${azurerm_network_interface.nagios_nic.id}"]
    vm_size              = "${var.vmsizes}"
    
    
#  Uncomment this line to delete the OS disk automatically when deleting the VM
    delete_os_disk_on_termination = true
#  Uncomment this line to delete the data disks automatically when deleting the VM
    delete_data_disks_on_termination = true

    storage_os_disk {
        name              = "nagios_OsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }


    storage_image_reference {
        publisher = "RedHat"
        offer     = "RHEL"
        sku       = "7.5"
        version   = "7.5.2018081519"
    }

    os_profile {
        computer_name  = "nagios"
        admin_username = "${var.VMAdminName}"
        admin_password = "${var.VMAdminPassword}"
        #custom_data = "${file("${path.root}${var.CloudinitscriptPath}")}"
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }

    boot_diagnostics {
        enabled = "true"
        storage_uri = "${azurerm_storage_account.nagios_storageaccount.primary_blob_endpoint}"
    }

    tags {
        environment = "NAGIOS"
    }
}
output "ip NAGIOS" {
  value = "${azurerm_public_ip.nagios_publicip.ip_address}"
}