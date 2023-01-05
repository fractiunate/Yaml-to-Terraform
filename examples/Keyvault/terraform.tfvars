subid         = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
clientid      = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
client_secret = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
tenantid      = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

KvName        = "yourkeyvault"
location      = "westeurope"
rg            = "yourresourcegroup"
enablerbac    = false

accesspolicies =  {

    pol0 = {
        appid                      = null
        objid                      = "youradgroupobjid"
        tenantid                   = "yourtentantid"
        certperm                   = null
        keyperm                    = null
        secperm                    = ["Get", "List", "Delete", "Backup", "Purge", "Recover", "Restore", "Set"]
        stoperm                    = null
      },
    pol1 = {
        appid                      = null
        objid                      = "youradgroupobjid"
        tenantid                   = "yourtentantid"
        certperm                   = ["Get", "List", "Delete"]
        keyperm                    = ["Get", "List", "Delete"]
        secperm                    = ["Get", "List"]
        stoperm                    = ["Get", "List", "Delete"]
      },
    pol2 = {
        appid                      = null
        objid                      = "youradgroupobjid"
        tenantid                   = "yourtentantid"
        certperm                   = ["Get", "List", "Delete"]
        keyperm                    = ["Get", "List", "Delete"]
        secperm                    = ["Get", "List", "Delete", "Backup", "Purge", "Recover", "Restore", "Set"]
        stoperm                    = ["Get", "List", "Delete"]
      }
  }

Secrets = {

    sc1 = {
        scname                      = "secret1"
        scvalue                     = "xxxxxx"
      },
    sc2 = {
        scname                      = "secret2"
        scvalue                     = "xxx"
      },
	  sc3 = {
        scname                      = "secret3"
        scvalue                     = "xxx"
      }
  }

