resource "vault_auth_backend" "aws" {
  type = "aws"
}

resource "vault_aws_auth_backend_role" "example" {
  backend                        = "${vault_auth_backend.aws.path}"
  role                           = "generate-certs"
  auth_type                      = "ec2"
  bound_iam_role_arn             = "${var.role_arn}"
  bound_iam_instance_profile_arn = "${var.profile_arn}"
  inferred_entity_type           = "ec2_instance"
  ttl                            = 60
  max_ttl                        = 120
  policies                       = ["ssl_certificates"]
}
