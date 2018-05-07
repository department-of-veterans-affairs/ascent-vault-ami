# Read access to secrets that the sonar services need
path "secret/sonar/admin" {
    capabilities = ["read"]
}

path "secret/sonar/database" {
    capabilities = ["read"]
}

path "secret/sonar/database/root" {
    capabilities = ["read"]
}

path "secret/github" {
    capabilities = ["read"]
}
