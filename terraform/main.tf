resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

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
  




