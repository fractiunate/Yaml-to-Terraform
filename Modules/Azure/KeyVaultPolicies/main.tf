resource "azurerm_key_vault_access_policy" "KeyVaultPolicy" {

  for_each                    = var.accesspolicies

  key_vault_id = var.kvid
  tenant_id    = each.value["tenantid"]
  object_id    = each.value["objid"]
  application_id = each.value["appid"]

  certificate_permissions = each.value["certperm"] 
  key_permissions = each.value["keyperm"] 
  secret_permissions = each.value["secperm"]
  storage_permissions = each.value["stoperm"]
}