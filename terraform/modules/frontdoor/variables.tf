variable "resource_group_name" {
    description = "Resource Group"
    type = string
    default = "ecs-rg1"
}

variable "location" {
    description = "Resource location"
    type = string
    default = "UK South"
  
}

variable "frontdoor_profile_name" {
    description = "Frontdoor profile"
    type = string
    default = "ecs-frontdoor-profile"

}

variable "sku_name" {
    description = "SKU name for Frontdoor profile"
    type = string
    default = "Standard_AzureFrontDoor"
  
}

variable "frontdoor_endpoint_name" {
    description = "Frontdoor endpoint"
    type = string
    default = "ecs-frontdoor-endpoint"
  
    }

variable "frontdoor_route_name" {
    description = "Frontdoor route"
    type = string
    default = "ecs-frontdoor-route"
  
}

variable "frontdoor_origin_name" {
    description = "Frontdoor origin"
    type = string
    default = "ecs-frontdoor-origin"
  
}
  

variable "frontdoor_origin_group_name" {
    description = "Frontdoor origin group"  
    type = string
    default = "ecs-frontdoor-origin-group"
}

variable "origin_enabled" {
    description = "Enable Front Door origin"
    type = bool
    default = true
}

variable "certificate_check_enabled" {
    description = "Enable certificate name check for Front Door origin"
    type = bool
    default = true
  
}

variable "http_port" {
    description = "HTTP port for front door"
    type = number
    default = 80
  
}

variable "https_port" {
    description = "HTTPS port for Front Door origin"
    type = number
    default = 443
  
}

variable "container_app_fqdn" {
  description = "Container App FQDN"
  type        = string
}

variable "link_to_default_domain" {
  description = "Link to default domain in Front Door route"
  type        = bool
  default     = true
  
}

variable "frontdoor_route_enabled" {
  description = "Enable Front Door route"
  type        = bool
  default     = true
  
}

variable "forwarding_protocol" {
  description = "Forwarding protocol for Front Door route"
  type        = string
  default     = "HttpsOnly"
  
}

variable "https_redirect_enabled" {
  description = "Enable HTTPS redirect in Front Door route"
  type        = bool
  default     = true
  
}

variable "patterns_to_match" {
  description = "Patterns to match"
  type        = list(string)
  default     = ["/*"]
}

variable "supported_protocols" {
  description = "Supported protocols"
  type        = list(string)
  default     = ["Http", "Https"]

}

variable "custom_domain" {
  description = "Custom domain name"
  type        = string
}

variable "ecs-customDomain" {
    description = "Custom domain name"
    type        = string
    default = "ecs-customDomain"
  
}

variable "certificate_type" {
    description = "Type of certificate for custom domain"
    type        = string
    default = "ManagedCertificate"
}


