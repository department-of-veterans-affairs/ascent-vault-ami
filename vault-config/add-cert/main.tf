resource "vault_generic_secret" "certificate" {
  path = "secret/ssl/trusted/${var.alias}"

  data_json = <<EOT
  {
    "certificate": ${jsonencode(file(var.certificate_file))}
  }
EOT
}

