# Creating Azure Log Analytics workspace
resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = var.log_analytics
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = var.retention
}
# Creating Azure Container Apps enviroment
resource "azurerm_container_app_environment" "aca_environment" {
  name                       = var.container_app_env
  location                   = var.location
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics_workspace.id
}

 

# Creating Azure Container App
resource "azurerm_container_app" "container_app" {
  name                         = var.container_app_name
  container_app_environment_id = azurerm_container_app_environment.aca_environment.id
  resource_group_name          = var.resource_group_name
  revision_mode                = var.revision_mode

   secret {
    name  = "acr-password"
    value = var.acr_password
  }

   registry {
    server               = var.acr_login_server
    username             = var.acr_username
    password_secret_name = "acr-password"

  }
 
    ingress {
      external_enabled = true
      target_port      = 3000
      transport        = "http"
      traffic_weight {
        percentage      = 100
        latest_revision = true
      }
    }

    template {
      min_replicas = var.min_replicas
      max_replicas = var.max_replicas

      container {
        name   = var.container_app_name
        image = var.container_app_image
        cpu    = var.cpu
        memory = var.memory
      }
    }
}
