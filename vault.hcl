storage "consul" {
  address = "127.0.0.1:8500"
  path    = "vault/"
  redirect_addr = ""
}
listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_cert_file = "/etc/vault.d/server.pem"
  tls_key_file  = "/etc/vault.d/server.key"
}
