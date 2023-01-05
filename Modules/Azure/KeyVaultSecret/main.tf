resource "azurerm_key_vault_secret" "KeyVaultSecret" {
  
  for_each                    = var.Secrets

     key_vault_id                = var.kvid
     name                     = each.value["scname"]
     value                    = each.value["scvalue"]
}