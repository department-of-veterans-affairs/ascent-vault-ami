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
  disable_read = "true"

  data_json = <<EOT
{
  "common_name": "${var.ca_common_name}",
  "ttl": "8760h"
}
EOT
}

resource "vault_generic_secret" "cert_role" {
  path = "pki/roles/vetservices"

  data_json = <<EOT
{
  "allow_any_name": false,
  "allow_bare_domains": false,
  "allow_glob_domains": false,
  "allow_ip_sans": true,
  "allow_localhost": true,
  "allow_token_displayname": false,
  "allowed_other_sans": null,
  "basic_constraints_valid_for_non_ca": false,
  "client_flag": true,
  "code_signing_flag": false,
  "country": [],
  "email_protection_flag": false,
  "enforce_hostnames": true,
  "generate_lease": false,
  "key_bits": 2048,
  "key_type": "rsa",
  "key_usage": ["DigitalSignature", "KeyAgreement", "KeyEncipherment"],
  "locality": [],
  "no_store": false,
  "organization": [],
  "ou": [],
  "policy_identifiers": [],
  "postal_code": [],
  "province": [],
  "require_cn": true,
  "server_flag": true,
  "street_address": [],
  "ttl": "0s",
  "use_csr_common_name": true,
  "use_csr_sans": true,
  "allowed_domains": ["${var.ca_common_name}"],
  "allow_subdomains": true,
  "max_ttl": "8760h0m0s"
}
EOT
}