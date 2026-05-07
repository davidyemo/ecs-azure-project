variable "client_id" {
  description = "The client ID of the Azure service principal."
  type        = string
}

variable "client_secret" {
    description = " The Client secret"
    type = string
}

variable "tenant_id" {
    description = " The Tenant ID"
    type = string
}

variable "subscription_id" {
    description = " The Subscription ID"
    type = string
  
}

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

variable "acr_name" {
    description = "The name of the Azure Container Registry"
    type = string
    default = "ecsazurecontainerregistry1"
}

variable "custom_domain" {
  description = "Custom domain name"
  type        = string
  default = "dyemo.co.uk"
}