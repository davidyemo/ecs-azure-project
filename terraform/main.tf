resource "azurerm_resource_group" "resource_group" {
  name     = local.resource_group_name
  location = local.location
}

resource "azurerm_container_registry" "container_registry" {
  name                = "ecsazurecontainerRegistry1"
  resource_group_name = local.resource_group_name
  location            = local.location
  sku                 = "Basic"
  admin_enabled       = false

  }
