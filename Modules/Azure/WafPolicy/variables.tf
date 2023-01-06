variable "resource_group" {
  description = "(Required) Resource Group of the App GW WAF Policy to be created"  
}

variable "location" {
  description = "(Required) Location of the App GW WAF Policy to be created"
}

variable "wafpolicylist" {
  description = "(Required) Settings of the WAF Policy/s to be created"  
}