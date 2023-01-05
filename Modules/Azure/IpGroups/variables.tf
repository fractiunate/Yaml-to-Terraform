variable "IpGroups" {
  description = "ipgroups to create"
  type        = any
}

variable "Rg" {
  description = "Ipgroup Resource Group"
  type        = string
}


variable "Tags" {
  description = "tags to create"
  type        = any
}