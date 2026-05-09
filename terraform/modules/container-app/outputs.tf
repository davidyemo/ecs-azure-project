output "container_app_environment_id" {
  value = azurerm_container_app_environment.aca_environment.id
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.log_analytics_workspace.id
}
output "container_app_fqdn" {
  value = azurerm_container_app.container_app.ingress[0].fqdn
}