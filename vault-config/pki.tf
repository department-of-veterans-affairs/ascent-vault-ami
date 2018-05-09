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
  path = "pki/root/generate/internal"

  data_json = <<EOT
{
  "common_name": "${var.ca_common_name}"
  "ttl": "8760h"
}
EOT
}

resource "vault_generic_secret" "cert_role" {
  path = "pki/roles/vetservices"

  data_json = <<EOT
{
  "allowed_domains": "${var.ca_common_name}",
  "allow_subdomains": true,
  "max_ttl": "8760h"
}
EOT
}