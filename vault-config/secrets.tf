###############################################################################
#
# Application Secrets
#
# Load secrets used by our applications. Generate random values for passwords
# to keep values unqiue in all environments.
###############################################################################


# ---------------------------------------------------------------------------------------------------------------------
# DISCOVERY SERVICE
# ---------------------------------------------------------------------------------------------------------------------


resource "random_string" "discovery_password" {
  length = 30
  special = false
  upper = true
  lower = true
  number = true
}

resource "vault_generic_secret" "discovery" {
  path = "secret/ascent-discovery"

  data_json = <<EOT
{
  "username": "eureka",
  "password": "${random_string.discovery_password.result}"
}
EOT
}

# ---------------------------------------------------------------------------------------------------------------------
# CONFIG SERVICE
# ---------------------------------------------------------------------------------------------------------------------


resource "random_string" "config_password" {
  length = 30
  special = false
  upper = true
  lower = true
  number = true
}

resource "vault_generic_secret" "config" {
  path = "secret/ascent-config"

  data_json = <<EOT
{
  "username": "config",
  "password": "${random_string.config_password.result}"
}
EOT
}

resource "vault_generic_secret" "config_server_git" {
  path = "secret/ascent-config-server/git"

  data_json = <<EOT
{
  "access_token": "${var.git_access_token}"
}
EOT
}

resource "random_string" "config_broker_password" {
  length = 30
  special = true
  upper = true
  lower = true
  number = true
}

resource "vault_generic_secret" "config_broker" {
  path = "secret/ascent-config-server/messagebroker"

  data_json = <<EOT
{
  "username": "guest",
  "password": "${random_string.config_broker_password.result}"
}
EOT
}

# ---------------------------------------------------------------------------------------------------------------------
# ZIPKIN SERVICE
# ---------------------------------------------------------------------------------------------------------------------


resource "random_string" "zipkin_password" {
  length = 30
  special = true
  upper = true
  lower = true
  number = true
}


# ---------------------------------------------------------------------------------------------------------------------
# DASHBOARD SERVICE
# ---------------------------------------------------------------------------------------------------------------------


resource "random_string" "dashboard_password" {
  length = 30
  special = true
  upper = true
  lower = true
  number = true
}

resource "vault_generic_secret" "dashboard" {
  path = "secret/ascent-dashboard"

  data_json = <<EOT
{
  "username": "dashboard",
  "password": "${random_string.dashboard_password.result}"
}
EOT
}

# ---------------------------------------------------------------------------------------------------------------------
# ALL MICRO-SERVICES
# ---------------------------------------------------------------------------------------------------------------------

resource "random_string" "spring_boot_admin_password" {
  length = 30
  special = false
  upper = true
  lower = true
  number = true
}

resource "random_string" "redis_password" {
  length = 30
  special = true
  upper = true
  lower = true
  number = true
}

resource "random_string" "rabbitmq_password" {
  length = 30
  special = false
  upper = true
  lower = true
  number = true
}

resource "vault_generic_secret" "application" {
  path = "secret/application"

  data_json = <<EOT
{
  "ascent.security.jwt.secret": "${var.jwt_secret_token}",
  "ascent.security.username": "admin",
  "ascent.security.password": "default",
  "spring.redis.password": "${random_string.redis_password.result}",
  "spring.rabbitmq.username": "admin",
  "spring.rabbitmq.password": "${random_string.rabbitmq_password.result}",
  "bgs.username": "${var.bgs_username}",
  "bgs.password": "${var.bgs_password}"
}
EOT
}


# ---------------------------------------------------------------------------------------------------------------------
# NEXUS
# ---------------------------------------------------------------------------------------------------------------------

resource "random_string" "nexus_password" {
  length = 30
  special = true
  upper = true
  lower = true
  number = true
}

resource "vault_generic_secret" "nexus" {
  path = "secret/nexus"

  data_json = <<EOT
{
  "username": "nexus",
  "password": "${random_string.nexus_password.result}"
}
EOT
}

# ---------------------------------------------------------------------------------------------------------------------
# JENKINS
# ---------------------------------------------------------------------------------------------------------------------

resource "random_string" "jenkins_password" {
  length = 30
  special = true
  upper = true
  lower = true
  number = true
}

resource "random_string" "fortify_ssh_password" {
  length = 30
  special = true
  upper = true
  lower = true
  number = true
}

resource "vault_generic_secret" "jenkins" {
  path = "secret/jenkins"

  data_json = <<EOT
{
  "username": "jenkins",
  "password": "${random_string.jenkins_password.result}",
  "fortify_ssh_username": "jenkins",
  "fortify_ssh_password": "${random_string.fortify_ssh_password.result}"
}
EOT
}

# ---------------------------------------------------------------------------------------------------------------------
# SONAR
# ---------------------------------------------------------------------------------------------------------------------

resource "vault_generic_secret" "sonar_github" {
  path = "secret/github"

  data_json = <<EOT
{
  "token": "${var.sonar_git_access_token}"
}
EOT
}

resource "random_string" "sonar_admin_password" {
  length = 30
  special = true
  upper = true
  lower = true
  number = true
}

resource "vault_generic_secret" "sonar" {
  path = "secret/sonar/admin"

  data_json = <<EOT
{
  "password": "${random_string.sonar_admin_password.result}"
}
EOT
}

resource "random_string" "sonar_database_password" {
  length = 30
  special = true
  upper = true
  lower = true
  number = true
}

resource "vault_generic_secret" "sonar_database" {
  path = "secret/sonar/database"

  data_json = <<EOT
{
  "user": "sonar",
  "password": "${random_string.sonar_database_password.result}"
}
EOT
}

resource "random_string" "sonar_db_root_password" {
  length = 30
  special = true
  upper = true
  lower = true
  number = true
}

resource "vault_generic_secret" "sonar_database_root" {
  path = "secret/sonar/database/root"

  data_json = <<EOT
{
  "password": "${random_string.sonar_db_root_password.result}"
}
EOT
}

# ---------------------------------------------------------------------------------------------------------------------
# FORTIFY
# ---------------------------------------------------------------------------------------------------------------------

resource "random_string" "foritfy_db_password" {
  length = 30
  special = true
  upper = true
  lower = true
  number = true
}

resource "vault_generic_secret" "fortify" {
  path = "secret/fortify"

  data_json = <<EOT
{
  "database_username": "fortify",
  "database_password": "${random_string.foritfy_db_password.result}"
}
EOT
}


# ---------------------------------------------------------------------------------------------------------------------
# GRAFANA
# ---------------------------------------------------------------------------------------------------------------------

resource "random_string" "database_password" {
  length = 30
  special = false
  upper   = true
  lower   = true
  number  = true
}

resource "vault_generic_secret" "grafana" {
  path = "secret/grafana"
  data.json = <<EOT
  {
    "database_username": "grafana"
  }
EOT
}
