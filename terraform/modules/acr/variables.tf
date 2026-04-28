variable "acr_name" {
    description = "The name of the Azure Container Registry"
    type = string
    default = "ecsazurecontainerregistry1"
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

variable "sku" {
    description = "The SKU of the Azure Container Registry"
    type = string
    default = "Basic"
  
}

variable "admin_enabled" {
    description = "Admin Enabled"
    type = bool
    default = true
}



