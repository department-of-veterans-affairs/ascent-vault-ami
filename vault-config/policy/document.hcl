#This is a placeholder rule for this policy until this application has some specific secret needs.
path "secret/ascent-application" {
    capabilities = ["read", "list"]
}

path "secret/vetservices-document" {
    capabilities = ["read", "list"]
}

path "secret/vetservices-document,*" {
    capabilities = ["read", "list"]
}

