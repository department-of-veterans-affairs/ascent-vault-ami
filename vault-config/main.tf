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

resource "vault_policy" "ascent-app" {
    name = "ascent-app"
    policy = "${file("${path.module}/policy/ascent-app.hcl")}"
}

resource "vault_policy" "ascent-config" {
    name = "ascent-config"
    policy = "${file("${path.module}/policy/ascent-config.hcl")}"
}

resource "vault_policy" "ascent-dashboard" {
    name = "ascent-dashboard"
    policy = "${file("${path.module}/policy/ascent-dashboard.hcl")}"
}

resource "vault_policy" "ascent-demo" {
    name = "ascent-demo"
    policy = "${file("${path.module}/policy/ascent-demo.hcl")}"
}

resource "vault_policy" "ascent-gateway" {
    name = "ascent-gateway"
    policy = "${file("${path.module}/policy/ascent-gateway.hcl")}"
}

resource "vault_policy" "ascent-zipkin" {
    name = "ascent-zipkin"
    policy = "${file("${path.module}/policy/ascent-zipkin.hcl")}"
}

resource "vault_policy" "elasticsearch" {
    name = "elasticsearch"
    policy = "${file("${path.module}/policy/elasticsearch.hcl")}"
}

resource "vault_policy" "intenttofile" {
    name = "intenttofile"
    policy = "${file("${path.module}/policy/intenttofile.hcl")}"
}

resource "vault_policy" "jenkins-ci" {
    name = "jenkins-ci"
    policy = "${file("${path.module}/policy/jenkins-ci.hcl")}"
}

resource "vault_policy" "kibana" {
    name = "kibana"
    policy = "${file("${path.module}/policy/kibana.hcl")}"
}

resource "vault_policy" "nexus" {
    name = "nexus"
    policy = "${file("${path.module}/policy/nexus.hcl")}"
}

resource "vault_policy" "redis" {
    name = "redis"
    policy = "${file("${path.module}/policy/redis.hcl")}"
}

resource "vault_policy" "refdata" {
    name = "refdata"
    policy = "${file("${path.module}/policy/refdata.hcl")}"
}

resource "vault_policy" "sonar" {
    name = "sonar"
    policy = "${file("${path.module}/policy/sonar.hcl")}"
}

###############################################################################
#
# Vault Roles
#
###############################################################################

resource "vault_generic_secret" "role_ascent_platform" {
  path = "auth/token/roles/ascent-platform"

  data_json = <<EOT
{ 
  "disallowed_policies": [],
  "explicit_max_ttl": 0,
  "orphan": false,
  "path_suffix": "",
  "period": 0,
  "renewable": true,
  "role_name": "ascent-platform",
  "allowed_policies": ["ascent-app","ascent-config","ascent-dashboard","ascent-zipkin","ascent-gateway"]
}
EOT
}

resource "vault_generic_secret" "role_ascent_demo" {
  path = "auth/token/roles/ascent-demo"

  data_json = <<EOT
{
  "disallowed_policies": [],
  "explicit_max_ttl": 0,
  "orphan": false,
  "path_suffix": "",
  "period": 0,
  "renewable": true,
  "role_name": "ascent-demo",
  "allowed_policies": ["ascent-app","ascent-demo"]
}
EOT
}

resource "vault_generic_secret" "role_refdata" {
  path = "auth/token/roles/refdata"

  data_json = <<EOT
{
  "disallowed_policies": [],
  "explicit_max_ttl": 0,
  "orphan": false,
  "path_suffix": "",
  "period": 0,
  "renewable": true,
  "role_name": "refdata",
  "allowed_policies": ["ascent-app","refdata"]
}
EOT
}

resource "vault_generic_secret" "role_intenttofile" {
  path = "auth/token/roles/intenttofile"

  data_json = <<EOT
{
  "disallowed_policies": [],
  "explicit_max_ttl": 0,
  "orphan": false,
  "path_suffix": "",
  "period": 0,
  "renewable": true,
  "role_name": "intenttofile",
  "allowed_policies": ["ascent-app","intenttofile"]
}
EOT
}

resource "vault_generic_secret" "role_redis" {
  path = "auth/token/roles/redis"

  data_json = <<EOT
{
  "disallowed_policies": [],
  "explicit_max_ttl": 0,
  "orphan": false,
  "path_suffix": "",
  "period": 0,
  "renewable": true,
  "role_name": "redis",
  "allowed_policies": ["redis"]
}
EOT
}

resource "vault_generic_secret" "role_elk" {
  path = "auth/token/roles/elk"

  data_json = <<EOT
{
  "disallowed_policies": [],
  "explicit_max_ttl": 0,
  "orphan": false,
  "path_suffix": "",
  "period": 0,
  "renewable": true,
  "role_name": "elk",
  "allowed_policies": ["elasticsearch","kibana"]
}
EOT
}

resource "vault_generic_secret" "role_ci" {
  path = "auth/token/roles/ci"

  data_json = <<EOT
{
  "disallowed_policies": [],
  "explicit_max_ttl": 0,
  "orphan": false,
  "path_suffix": "",
  "period": 0,
  "renewable": true,
  "role_name": "ci",
  "allowed_policies": ["jenkins-ci","sonar","nexus"]
}
EOT
}