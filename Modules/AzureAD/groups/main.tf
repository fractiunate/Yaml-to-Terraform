resource "azuread_group" "this" {
  for_each = var.groups

    display_name = each.value.name
    description = each.value.description

    security_enabled = true
}