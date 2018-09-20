resource "vault_generic_secret" "certificate" {
  path = "secret/ssl/trusted/${var.alias}"

  data_json = <<EOT
  {
    "certificate": ${jsonencode(var.certificate)}
  }
EOT
}
