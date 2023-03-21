# Define Terraform provider
terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.36.0"
    }
  }
}
# Configure the Azure provider
provider "azurerm" {
  subscription_id = var.subid
  client_id       = var.clientid
  client_secret   = var.client_secret
  tenant_id       = var.tenantid
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "azuread" {
  client_id       = var.clientid
  client_secret   = var.client_secret
  tenant_id       = var.tenantid
}

data "azurerm_client_config" "current" {}


