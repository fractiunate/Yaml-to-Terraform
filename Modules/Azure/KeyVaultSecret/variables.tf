variable "Secrets" {
  description = "Secrets to Add"
  type        = any
}

variable "kvid" {
  description = "Keyvault ID"
  type        = string
}

/*
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
*/

