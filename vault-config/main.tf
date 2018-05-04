provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables described above, so that each user can have
  # separate credentials set in the environment.
  #
  # This will default to using $VAULT_ADDR
  # But can be set explicitly
  # address = "https://vault.example.net:8200"
}

###############################################################################
#
# Vault Policies
#
###############################################################################

resource "vault_policy" "devops" {
    name = "devops"
    policy = "${file("${path.module}/policy/devops.hcl")}"
}