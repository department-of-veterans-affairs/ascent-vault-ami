# Read access for all secrets in the ci, dev, and test environments
path "secret/jenkins/*" {
    capabilities = ["read", "list"]
}

# Ability to generate Vault tokens to provide to ascent applications
path "auth/token/create/*" {
    capabilities = ["create", "read", "update"]
}