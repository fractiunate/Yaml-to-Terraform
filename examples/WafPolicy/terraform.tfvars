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
    custom_rules = {
      custom_rules0 = {
        name = "Rule1"
        priority = "1"
        rule_type = "MatchRule"
        action = "Block"
        match_conditions = {
          match_conditions0 = {
            match_variables = {
              match_variables0 = {
                variable_name = "RemoteAddr"
                selector = ""
              }
            }
                          match_values = ["192.168.1.0/24", "10.0.0.0/24"]
            operator = "IPMatch"
            negation_condition = "false"
          }
        }
      }
      custom_rules1 = {
        name = "Rule2"
        priority = "2"
        rule_type = "MatchRule"
        action = "Block"
        match_conditions = {
          match_conditions0 = {
            match_variables = {
              match_variables0 = {
                variable_name = "RemoteAddr"
                selector = ""
              }
            }
                          match_values = ["192.168.1.0/24", "10.0.0.0/24"]
            operator = "IPMatch"
            negation_condition = "false"
          }
          match_conditions1 = {
            match_variables = {
              match_variables0 = {
                variable_name = "RequestHeaders"
                selector = "UserAgent"
              }
            }
                          match_values = ["Windows"]
            operator = "Contains"
            negation_condition = "false"
          }
        }
      }
    }
    managed_rules = {
      exclusion = {
        exclusion0 = {
          match_variable = "RequestHeaderNames"
          selector_match_operator = "Equals"
          selector = "x-company-secret-header"
		  excluded_rule_set = []
        }
        exclusion1 = {
          match_variable = "RequestCookieNames"
          selector_match_operator = "EndsWith"
          selector = "too-tasty"
		  excluded_rule_set = []
        }
		    exclusion2 = {
          match_variable = "RequestArgNames"
          selector_match_operator = "EndsWith"
          selector = "myarg"
          excluded_rule_set = {
            excluded_rule_set0 = {
              type = "OWASP"
              version = "3.2"
              rule_group = {
              rule_group0 = {
                rule_group_name = "REQUEST-920-PROTOCOL-ENFORCEMENT"
                excluded_rules = ["920100","920120"]
              }
              rule_group1 = {
                rule_group_name = "REQUEST-921-PROTOCOL-ATTACK"
                excluded_rules = ["921110","921120"]
              }
              }
            }
            }
        }
		
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
  wafpolicylist1 = {
    name = "waf-policy-weu-02"
    policy_settings = {
      enabled = "true"
      mode = "Prevention"
      request_body_check = "true"
      file_upload_limit_in_mb = "100"
      max_request_body_size_in_kb = "128"
    }
          custom_rules = []
    managed_rules = {
              exclusion = []
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
}

