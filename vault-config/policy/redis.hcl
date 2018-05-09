# Redis needs access to its password for basic authentication
path "secret/application" {
    capabilities = ["read", "list"]
    allowed_parameters = {
        "spring.redis.password" = []
    }
}