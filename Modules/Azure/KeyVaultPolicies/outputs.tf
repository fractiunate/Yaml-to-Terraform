output "kvp" {   
value        = values(azurerm_key_vault_access_policy.KeyVaultPolicy).*.id
}