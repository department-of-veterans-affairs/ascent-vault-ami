###############################################################################
#
# PKI Backend
# 
# Setup and configure the Vault PKI backend to supply SSL certificates for our
# internal services.
###############################################################################

# Set default lease for PKI certificates to 1 year
resource "vault_mount" "pki" {
    path = "pki"
    type = "pki"
    default_lease_ttl_seconds = 315360000
    max_lease_ttl_seconds     = 315360000
}

# ---------------------------------------------------------------------------------------------------------------------
# Configure the CA
# ---------------------------------------------------------------------------------------------------------------------

resource "vault_generic_secret" "ca" {
  path = "pki/config/ca"

  data_json = <<EOT
{
  "pem_bundle": "${format("%s\n%s",file("${var.ca_cert_file}"), file("${var.ca_private_key_file}"))}"
}
EOT
}