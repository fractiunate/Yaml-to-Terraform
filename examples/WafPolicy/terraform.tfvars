subid = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

clientid = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

client_secret = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

tenantid = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

resource_group = "wafpolicies"

location = "West Europe"

wafpolicylist = {
  wafpolicylist0 = {
    name = "waf-policy-weu-01"
    policy_settings = {
      enabled = "true"
      mode = "Prevention"
      request_body_check = "true"
      file_upload_limit_in_mb = "100"
      max_request_body_size_in_kb = "128"
    }
    managed_rule_set = {
      managed_rule_set0 = {
        type = "OWASP"
        version = "3.2"
        rule_group_override = {
          rule_group_override0 = {
            rule_group_name = "REQUEST-920-PROTOCOL-ENFORCEMENT"
            rules = {
              rules0 = {
                id = "920300"
                enabled = "true"
                action = "Log"
              }
              rules1 = {
                id = "920440"
                enabled = "true"
                action = "Log"
              }
            }
          }
          rule_group_override1 = {
            rule_group_name = "REQUEST-941-APPLICATION-ATTACK-XSS"
            rules = {
              rules0 = {
                id = "941180"
                enabled = "true"
                action = "Log"
              }
              rules1 = {
                id = "941190"
                enabled = "true"
                action = "Log"
              }
            }
          }
        }
      }
    }
  }
  wafpolicylist1 = {
    name = "waf-policy-weu-02"
    policy_settings = {
      enabled = "true"
      mode = "Prevention"
      request_body_check = "true"
      file_upload_limit_in_mb = "100"
      max_request_body_size_in_kb = "128"
    }
    managed_rule_set = {
      managed_rule_set0 = {
        type = "OWASP"
        version = "3.2"
        rule_group_override = {
          rule_group_override0 = {
            rule_group_name = "REQUEST-920-PROTOCOL-ENFORCEMENT"
            rules = {
              rules0 = {
                id = "920300"
                enabled = "true"
                action = "Log"
              }
              rules1 = {
                id = "920440"
                enabled = "true"
                action = "Log"
              }
            }
          }
          rule_group_override1 = {
            rule_group_name = "REQUEST-941-APPLICATION-ATTACK-XSS"
            rules = {
              rules0 = {
                id = "941180"
                enabled = "true"
                action = "Log"
              }
              rules1 = {
                id = "941190"
                enabled = "true"
                action = "Log"
              }
            }
          }
        }
      }
    }
  }
}

