path "pki/issue/vetservices-dot-gov" {
  capabilities = ["create", "read", "update", "list"]
}


path "pki/issue/vetservices-dot-gov/*" {
  capabilities = ["create", "read", "update", "list"]
}
