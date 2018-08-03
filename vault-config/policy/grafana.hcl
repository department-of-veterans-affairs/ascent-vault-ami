# Read access to secrets that the grafana services need

path "secret/grafana" {
    capabilities = ["read"]
}
