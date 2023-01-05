resource "azurerm_ip_group" "IpGroup" {

  for_each                    = var.IpGroups

  name                        = each.value["Name"]
  location                    = each.value["Location"]
  resource_group_name         = var.Rg

  cidrs                       = each.value["IpAddresses"]

  tags                        = var.Tags

}