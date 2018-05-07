path "secret/ascent-gateway" {
    capabilities = ["read", "list"]
}

path "secret/ascent-gateway,*" {
    capabilities = ["read", "list"]
}