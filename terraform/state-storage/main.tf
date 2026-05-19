resource "azurerm_storage_account" "tfstate" {
  name                     = "ecstfstate"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
# Create a storage container for Terraform state files
resource "azurerm_storage_container" "tfstate_container" {
  name                  = "content"
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}