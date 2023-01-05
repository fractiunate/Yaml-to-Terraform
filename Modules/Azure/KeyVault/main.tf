resource "azurerm_key_vault" "KeyVault" {
  name                        = var.KvName
  location                    = var.location
  resource_group_name         = var.rg
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enable_rbac_authorization = var.enablerbac 
  sku_name = "standard"

  //access_policy {}
}