###############################################################################
#
# Setup Authentication with Vault using Github
# Access policies are based on team membership within the organization
#
###############################################################################

resource "vault_auth_backend" "github" {
  type = "github"
}

resource "vault_generic_secret" "github_dsva" {
  path = "auth/github/config"

  data_json = <<EOT
{
  "base_url": "",
  "max_ttl": 0,
  "ttl": 0,
  "organization": "department-of-veterans-affairs"
}
EOT
}

#------------------------------------------------------
# Map team membership to roles
#------------------------------------------------------

resource "vault_generic_secret" "github_devops" {
  path = "auth/github/map/teams/ascent-devops"

  data_json = <<EOT
{
  "key": "ascent-devops"
  "value": "devops"
}
EOT
}
