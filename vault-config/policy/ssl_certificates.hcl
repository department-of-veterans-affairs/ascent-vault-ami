path "pki/issue/vetservices" {
  capabilities = ["create", "read", "update", "list"]
}


path "pki/issue/vetservices/*" {
  capabilities = ["create", "read", "update", "list"]
}
