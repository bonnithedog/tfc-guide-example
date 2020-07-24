

#Definition of Variables


CloudinitscriptPath = "/Scripts/example.ps1"


#Definition resource virtual machine

    #Definition vm_size Chose one from selected B1 Cheap ->> more expensive
                #Standard_B1s 
                #Standard_B1ms
                #Standard_B2s 
                #Standard_B2ms
                #Standard_B4ms
                #Standard_B8ms
    vmsizes = "Standard_B1s"


#Definition os_profile

    #Definition of admin_username
    VMAdminName = "matmerkadmin"
    
    #Definition of admin_password
    VMAdminPassword = ".fM:f/66%4,U&838"
    
# source address prefix to be applied to all rules

    ADMdefault = "195.1.42.70"

  # Example ["10.0.3.0/24"] or ["VirtualNetwork"]



  