###############################################################################
#
# Application Secrets
# 
# Load secrets used by our applications. Generate random values for passwords
# to keep values unqiue in all environments.
###############################################################################

resource "random_string" "es_admin_password" {
  length = 16
  special = true
  upper = true
  lower = true
  number = true
}

resource "vault_generic_secret" "elasticsearch_admin" {
  path = "/secret/elasticsearch/admin"

  data_json = <<EOT
{
  "username": "elastic",
  "password": "${random_string.password.result}"
}
EOT
}