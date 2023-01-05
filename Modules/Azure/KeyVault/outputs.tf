output "keyvaultid" {
   value = azurerm_key_vault.KeyVault.id
}
output "keyvaulturl" {
   value = azurerm_key_vault.KeyVault.vault_uri
}
output "keyvaultname" {
   value = azurerm_key_vault.KeyVault.name
}