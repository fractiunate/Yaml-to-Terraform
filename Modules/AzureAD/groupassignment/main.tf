resource "azuread_group_member" "this" {

  for_each =  toset(var.group_assignments)

    group_object_id  = var.groups[var.group].id
    member_object_id = var.users[each.value].id

}
