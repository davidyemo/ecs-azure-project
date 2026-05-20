# Creating Azure Front Door profile, endpoint, origin group, origin, route, custom domain and custom domain association for the application
resource "azurerm_cdn_frontdoor_profile" "frontdoor_profile" {
  name                = var.frontdoor_profile_name
  resource_group_name = var.resource_group_name
  sku_name            = "Standard_AzureFrontDoor"
}

resource "azurerm_cdn_frontdoor_endpoint" "frontdoor_endpoint" {
  name                     = var.frontdoor_endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor_profile.id
}

resource "azurerm_cdn_frontdoor_origin_group" "frontdoor_origin_group" {
  name                     = var.frontdoor_origin_group_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor_profile.id

  load_balancing {}

}
resource "azurerm_cdn_frontdoor_origin" "frontdoor_origin" {
  name                          = var.frontdoor_origin_name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.frontdoor_origin_group.id
  enabled                       = var.origin_enabled
  certificate_name_check_enabled = var.certificate_check_enabled

  host_name  = var.container_app_fqdn
  origin_host_header = var.container_app_fqdn
  http_port  = var.http_port
  https_port = var.https_port
}

resource "azurerm_cdn_frontdoor_route" "frontdoor_route" {
  name                          = var.frontdoor_route_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.frontdoor_endpoint.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.frontdoor_origin_group.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.frontdoor_origin.id]
  link_to_default_domain          = var.link_to_default_domain
  cdn_frontdoor_custom_domain_ids = [azurerm_cdn_frontdoor_custom_domain.ecs-customDomain.id]

  enabled                = var.frontdoor_route_enabled
  forwarding_protocol    = var.forwarding_protocol
  https_redirect_enabled = var.https_redirect_enabled
  patterns_to_match      = var.patterns_to_match
  supported_protocols    = var.supported_protocols
}

resource "azurerm_cdn_frontdoor_custom_domain" "ecs-customDomain" {
  name                     = var.ecs-customDomain
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor_profile.id
  host_name                = var.custom_domain

  tls {
    certificate_type    = var.certificate_type

  }
}

resource "azurerm_cdn_frontdoor_custom_domain_association" "ecs-customDomainAssociation" {
  cdn_frontdoor_custom_domain_id = azurerm_cdn_frontdoor_custom_domain.ecs-customDomain.id
  cdn_frontdoor_route_ids        = [azurerm_cdn_frontdoor_route.frontdoor_route.id]
}
