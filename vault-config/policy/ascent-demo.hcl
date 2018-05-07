path "secret/ascent-demo-service" {
    capabilities = ["read", "list"]
}

path "secret/ascent-demo-service,*" {
    capabilities = ["read", "list"]
}

path "secret/ascent-document-service" {
    capabilities = ["read", "list"]
}

path "secret/ascent-document-service,*" {
    capabilities = ["read", "list"]
}