terraform {
  required_version = ">=1.4"
  required_providers {
    azurerm = ">=3.50"
  }
}

provider "azurerm" {
  features {}
  subscription_id   = var.subscription_id
  tenant_id         = var.tenant_id
}