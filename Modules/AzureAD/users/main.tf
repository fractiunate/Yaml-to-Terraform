resource "azuread_user" "this" {
    for_each = { for u in var.users : u.user_principal_name => u }

        user_principal_name = each.value.user_principal_name
        display_name = each.value.display_name
        password = each.value.password
        force_password_change = each.value.force_password_change
        mail_nickname = each.value.mail_nickname
        given_name = each.value.given_name
        surname = each.value.surname
        job_title = each.value.job_title
        department = each.value.department
        country = each.value.country
        usage_location = each.value.usage_location
        mobile_phone = each.value.mobile_phone
        city = each.value.city
        state = each.value.state
        street_address = each.value.street_address
        postal_code = each.value.postal_code
        account_enabled = each.value.account_enabled
        onpremises_immutable_id = each.value.on_premises_immutable_id
}