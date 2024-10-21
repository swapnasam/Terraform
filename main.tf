# Display a local variable for the number you want to display
locals {
	number_to_display = 42
}

# Output the number
output "displayed_number" {
	value = local.number_to_display
}

# Configure the Azure provider
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id

}

# Create a Resource Group
resource "azurerm_resource_group" "test_rg" {
  name     = "test-resources"
  location = "East US"
}

# Create a Storage Account
resource "azurerm_storage_account" "test_storage" {
  name                     = "teststoragetest"
  resource_group_name      = azurerm_resource_group.test_rg.name
  location                 = azurerm_resource_group.test_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}