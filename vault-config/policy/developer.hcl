path "secret/" {
    capabilities = ["list"]
}

path "secret/ascent-discovery" {
    capabilities = ["read", "list"]
}

path "secret/ascent-config" {
    capabilities = ["read", "list"]
}

path "secret/ascent-dashboard" {
    capabilities = ["read", "list"]
}

path "secret/ascent-gateway" {
    capabilities = ["read", "list"]
}

path "secret/application" {
    capabilities = ["read", "list"]
}

path "secret/ssl/*" {
    capabilities = ["read", "list"]
}