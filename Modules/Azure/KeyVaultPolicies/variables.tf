variable "accesspolicies" {
  description = "Accesspolicies to Add"
  type        = any
}

variable "kvid" {
  description = "Keyvault ID"
  type        = string
}

/*
accesspolicies = {

    pol1 = {
        appid                      = ""
        objid                      = "AD OBJ ID"
        tenantid                   = "tenantID"
        certperm                   = ["Get", "List", "Delete"]
        keyperm                    = ["Get", "List", "Delete"]
        secperm                    = ["Get", "List", "Delete"]
        stoperm                    = ["Get", "List", "Delete"]
      },
    pol2 = {
        appid                      = ""
        objid                      = "AD OBJ ID"
        tenantid                   = "tenantID"
        certperm                   = ["Get", "List", "Delete"]
        keyperm                    = ["Get", "List", "Delete"]
        secperm                    = ["Get", "List", "Delete"]
        stoperm                    = ["Get", "List", "Delete"]
      },
  }
*/

