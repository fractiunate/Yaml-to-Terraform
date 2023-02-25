resource "azurerm_web_application_firewall_policy" "waf-policy" {
    for_each                          = var.wafpolicylist
    
    resource_group_name               = var.resource_group
    location                          = var.location

    name                              = each.value.name
    
    dynamic "policy_settings" {
        for_each                      = [each.value.policy_settings]

        content {
          enabled                     = policy_settings.value.enabled
          mode                        = policy_settings.value.mode
          file_upload_limit_in_mb     = policy_settings.value.file_upload_limit_in_mb
          request_body_check          = policy_settings.value.request_body_check
          max_request_body_size_in_kb = policy_settings.value.max_request_body_size_in_kb
        }       
    }

    dynamic "custom_rules" {
        for_each                  = each.value.custom_rules

        content {
            name                  = custom_rules.value.name
            priority              = custom_rules.value.priority
            rule_type             = custom_rules.value.rule_type
            action                = custom_rules.value.action

            dynamic "match_conditions" {
                for_each          = custom_rules.value.match_conditions

                content {
                    dynamic "match_variables" {
                        for_each  = match_conditions.value.match_variables

                        content {
                            variable_name = match_variables.value.variable_name
                            selector      = match_variables.value.selector
                        }
                    }
                    match_values       = match_conditions.value.match_values
                    operator           = match_conditions.value.operator
                    negation_condition = match_conditions.value.negation_condition
                }
            }
        }
    }

    managed_rules {
	
		dynamic "exclusion" {
			for_each              = each.value.managed_rules.exclusion
			
			content{
				match_variable          = exclusion.value.match_variable
				selector_match_operator = exclusion.value.selector_match_operator
				selector                = exclusion.value.selector
			}
		}
        	
        dynamic "managed_rule_set" {
            for_each              = each.value.managed_rules.managed_rule_set

            content {
                type              = managed_rule_set.value.type
                version           = managed_rule_set.value.version

                dynamic "rule_group_override" {
                    for_each      = managed_rule_set.value.rule_group_override

                    content {
                        rule_group_name = rule_group_override.value.rule_group_name

                        dynamic "rule" {
                            for_each    = rule_group_override.value.rules

                            content {
                                id      = rule.value.id
                                enabled = rule.value.enabled
                                action  = rule.value.action
                            }
                        }
                    } 
                }
            }
        }
    }
}
