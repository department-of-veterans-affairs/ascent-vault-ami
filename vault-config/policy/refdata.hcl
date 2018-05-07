#This is a placeholder rule for this policy until this application has some specific secret needs.
path "secret/ascent-application" {
    capabilities = ["read", "list"]
}

path "secret/vetsapi-refdata-services" {
    capabilities = ["read", "list"]
}

path "secret/vetsapi-refdata-services,*" {
    capabilities = ["read", "list"]
}

path "secret/vetservices-refdata" {
    capabilities = ["read", "list"]
}

path "secret/vetservices-refdata,*" {
    capabilities = ["read", "list"]
}

