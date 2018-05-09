# Read access to secrets that the Filebeat service needs
path "secret/elasticsearch" {
    capabilities = ["read"]
}

path "secret/elasticsearch/*" {
    capabilities = ["read"]
}

path "secret/ascent-zipkin" {
    capabilities = ["read"]
}