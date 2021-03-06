resource "vault_auth_backend" "aws" {
  type = "aws"
}


resource "vault_aws_auth_backend_client" "proxy" {
  backend  = "${vault_auth_backend.aws.path}"
}

resource "vault_aws_auth_backend_role" "proxy" {
  backend                        = "${vault_auth_backend.aws.path}"
  role                           = "vetservices"
  auth_type                      = "ec2"
  bound_iam_role_arn             = "${var.role_arn}"
  inferred_entity_type           = "ec2_instance"
  ttl                            = 60
  max_ttl                        = 120
  policies                       = ["${vault_policy.ssl_certificates.name}"]

  depends_on                     = ["vault_aws_auth_backend_client.proxy"]
}
