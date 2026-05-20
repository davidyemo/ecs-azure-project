# Output variables for the Front Door module
output "frontdoor_endpoint_url" {
  value = "https://${azurerm_cdn_frontdoor_endpoint.frontdoor_endpoint.host_name}"
}