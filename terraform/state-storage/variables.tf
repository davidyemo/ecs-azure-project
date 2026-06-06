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

variable "account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "LRS"
}

variable "storage_account_name" {
  description = "Storage account name"
  type        = string
  default     = "ecstfstate"
}

variable "container_access_type" {
  description = "Storage container access type"
  type        = string
  default     = "private"
}