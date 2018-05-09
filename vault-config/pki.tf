###############################################################################
#
# PKI Backend
# 
# Setup and configure the Vault PKI backend to supply SSL certificates for our
# internal services.
###############################################################################


resource "vault_mount" "pki" {
    path = "pki"
    type = "pki"
    default_lease_ttl_seconds = "87600h"
    max_lease_ttl_seconds     = "87600h" 
}

# ---------------------------------------------------------------------------------------------------------------------
# Configure the CA
# ---------------------------------------------------------------------------------------------------------------------


data "local_file" "ca_cert" {
    filename = "${var.ca_cert_file}"
}

data "local_file" "ca_private_key" {
    filename = "${var.ca_private_key_file}"
}

resource "vault_generic_secret" "ca" {
  path = "pki/config/ca"

  data_json = <<EOT
{
  "pem_bundle": "${jsonencode(format("%s\n%s",file("${var.ca_cert_file}"), file("${var.ca_private_key_file}")))}"
}
EOT
}