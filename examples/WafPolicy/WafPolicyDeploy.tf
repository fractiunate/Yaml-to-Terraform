# Define Terraform provider
terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
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

data "azurerm_client_config" "current" {}

module "Resource-Group" {
  source         = "./modules/azure/ResourceGroup"

  rg             = var.rg
  location       = var.location          
}

module "WafPolicies" {
  source         = "./Modules/Azure/WafPolicy"

  resource_group = var.resource_group
  location       = var.location
  wafpolicylist = var.wafpolicylist   
  
  depends_on = [module.Resource-Group.rg-info]
}
