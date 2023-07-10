

/*
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "my-aks-cluster"
  location            = azurerm_resource_group.RGAppDev.location
  resource_group_name = azurerm_resource_group.RGAppDev.name
  dns_prefix          = "myakscluster"

  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = "Standard_B2s"  # Smallest VM size
    os_disk_size_gb = 30
  }
  
  
  service_principal {
    client_id     = "0b403db9-bc99-4148-8c0f-1b2a0d70518b"
    client_secret = "oRc8Q~gLLCBWyrFWf.OkOEhdfgK.GdT1~ExsSavx"
  }

  tags = {
    Environment = "Production"
    RU          = "100"
    CostCenter  = "12345"
  }
}


*/
