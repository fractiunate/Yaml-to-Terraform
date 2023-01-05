variable "KvName" {
  description = "KeyVault Name"
  type        = string
}

variable "location" {
  description = "KeyVault location"
  type        = string
}

variable "rg" {
  description = "KeyVault Resource Group"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID"
  type        = string
}

variable "enablerbac" {
  description = "Enable Rbac"
  type        = bool
}
