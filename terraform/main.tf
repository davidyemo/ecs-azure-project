resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

# add a comment to main.tf test pipeline

resource "azurerm_resource_group" "destroy_rg" {
  name     = "destroy_rg"
  location = "West Europe"
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"
}

# Creating Azure Container Registry

module "acr" {
  source = "./modules/acr"
  resource_group_name = var.resource_group_name
  location = var.location
  acr_name = var.acr_name
  depends_on = [azurerm_resource_group.resource_group] 
  }

# Creating Azure Container App
 module "container_app" {
  source = "./modules/container-app"
  resource_group_name = var.resource_group_name
  location = var.location
  container_app_image = "${module.acr.login_server}/myapp:latest"
  acr_login_server    = module.acr.login_server
  acr_username        = module.acr.acr_username
  acr_password        = module.acr.acr_password
  depends_on = [azurerm_resource_group.resource_group] 
  
 
  }
  
  #Creating Azure Front Door
module "frontdoor" {
  source              = "./modules/frontdoor"
  resource_group_name = var.resource_group_name
  location            = var.location
  container_app_fqdn  = module.container_app.container_app_fqdn
  custom_domain       = var.custom_domain
  depends_on          = [module.container_app]
}




