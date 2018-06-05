# Ascent applications request the following paths
#   secret/application
#   secret/<application name>  (ex. secret/ascent-discovery)
#   secret/application,<profile name>  (ex. secret/application,prod)
#   secret/<application name>,<profile name>
# See https://cloud.spring.io/spring-cloud-config/multi/multi__spring_cloud_config_server.html#_vault_backend

path "secret/ascent-application" {
    capabilities = ["read", "list"]
}

path "secret/ascent-application,*" {
    capabilities = ["read", "list"]
}

path "secret/application" {
    capabilities = ["read", "list"]
}

path "secret/application,*" {
    capabilities = ["read", "list"]
}

path "secret/ascent-discovery" {
    capabilities = ["read", "list"]
}

path "secret/ascent-discovery,*" {
    capabilities = ["read", "list"]
}

path "secret/ascent-config" {
    capabilities = ["read", "list"]
}

path "secret/ascent-config,*" {
    capabilities = ["read", "list"]
}

# Give application access to the set of trusted SSL certificates
path "secret/ssl/trusted" {
    capabilities = ["read", "list"]
}

path "secret/ssl/trusted/*" {
    capabilities = ["read", "list"]
}