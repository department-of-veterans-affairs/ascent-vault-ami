
# Read/Write for all secrets
path "*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}