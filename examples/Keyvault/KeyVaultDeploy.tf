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

module "Key-Vault" {
  source          = "./modules/azure/keyVault"
  
  KvName          = var.KvName 
  location        = var.location
  rg              = var.rg
  tenant_id       = var.tenantid
  enablerbac      = var.enablerbac

  depends_on = [module.Resource-Group.rg-info]
}

module "Key-Vault-Accesspolicies" {
  count           = var.enablerbac ? 0 : 1
  source          = "./modules/azure/keyvaultpolicies"
  kvid            = "${module.Key-Vault.keyvaultid}"
  accesspolicies  = var.accesspolicies
  
}

module "Key-Vault-Secrets" {
  source          = "./modules/azure/keyvaultsecret"

  kvid            = "${module.Key-Vault.keyvaultid}"
  Secrets         = var.Secrets

  depends_on = [module.Key-Vault-Accesspolicies.kvp]
}