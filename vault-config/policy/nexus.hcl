# Read access to secrets that the nexus services need

path "secret/nexus" {
    capabilities = ["read"]
}
