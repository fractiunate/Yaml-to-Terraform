variable "subid" {        
  description = "subid Name"
  type        = string
}
variable "clientid" {     
  description = "clientid Name"
  type        = string
}
variable "client_secret" { 
  description = "client_secret Name"
  type        = string
}
variable "tenantid" {     
  description = "tentantid Name"
  type        = string
}

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

variable "enablerbac" {
  description = "Enable Rbac"
  type        = bool
}

variable "accesspolicies" {
  description = "Accesspolicies to Add"
  type        = any
}

variable "Secrets" {
  description = "Secrets to Add"
  type        = any
}
