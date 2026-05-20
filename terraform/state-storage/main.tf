#Create a storage account for Terraform state files
resource "azurerm_storage_account" "tfstate" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
# Create a storage container for Terraform state files
resource "azurerm_storage_container" "tfstate_container" {
  name                  = "content"
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = var.container_access_type
}