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

variable "log_analytics" {
    description = "Log Analystics name"
    type = string
    default = "ecs-log-analytics"
  
}

variable "sku" {
    description = "Log analytics SKU"
    type = string
    default = "PerGB2018"
  
}

variable "retention" {
    description = "Log retention in days"
    type = number
    default = 30
  
}

variable "container_app_env" {
    description = "Container app enviroment name"
    type = string
    default = "ecs-container-app-env"
  
}

  
variable "container_app_name" {
    description = "Container app name"
    type = string
    default = "ecs-container-app"  
}



variable "revision_mode" {
    description = "Container app revision mode"
    type = string
    default = "Single"
  
}

variable "container_app_image" {
    description = "Container app image"
    type = string

  
}

variable "cpu" {
    description = "CPU allocation"
    type = number
    default = 0.25
}

variable "memory" {
  description = "Memory allocation"
  type = string
  default = "0.5Gi"
}

variable "acr_login_server" {
description = "Azure Container Registry login server"
type = string

}
variable "acr_username" {
description = "Azure Container Registry username"
type = string

}
variable "acr_password" {
description = "Azure Container Registry password"
type = string
sensitive = true
   
}