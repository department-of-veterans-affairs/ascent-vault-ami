path "secret/ascent-zipkin/*" {
    capabilities = ["read", "list"]
}

path "secret/ascent-zipkin" {
    capabilities = ["read", "list"]
}

path "secret/ascent-zipkin,*" {
    capabilities = ["read", "list"]
}