storage "dynamodb" {
  ha_enabled    = "true"
  region        = "us-east-1"
  table         = "vault-data"
}
listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_cert_file = "/etc/vault.d/server.pem"
  tls_key_file  = "/etc/vault.d/server.key"
}
