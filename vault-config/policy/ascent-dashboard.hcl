path "secret/ascent-dashboard" {
    capabilities = ["read", "list"]
}

path "secret/ascent-dashboard,*" {
    capabilities = ["read", "list"]
}