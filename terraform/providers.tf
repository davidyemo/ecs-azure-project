terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.68.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "ecs-rg1"
    storage_account_name = "ecstfstate"
    container_name       = "content"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}