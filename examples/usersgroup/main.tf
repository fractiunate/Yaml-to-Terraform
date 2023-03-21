locals {
  azuread_config = yamldecode(file("azuread.yaml"))
}

data "azuread_client_config" "current" {}

module "groups" {
  source = "./modules/AzureAD/groups"
  groups = { for g in local.azuread_config.azuread.groups : g.name => g }
}

module "users" {
  source = "./modules/AzureAD/users"
  users = local.azuread_config.azuread.users
}

module "group_assignments" {
  source = "./modules/AzureAD/groupassignments"
  
  for_each = { for g, u_list in local.azuread_config.azuread.group_assignments : g => u_list }

    group_assignments = each.value
    group = each.key
    groups = module.groups.groups
    users = module.users.users
} 
