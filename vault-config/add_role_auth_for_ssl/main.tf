resource "vault_auth_backend" "aws" {
  type = "aws"
}

resource "vault_aws_auth_backend_role" "instance_backend_role" {
  backend              = "${vault_auth_backend.aws.path}"
  role                 = "vetservices"
  auth_type            = "ec2"
  bound_iam_instance_profile_arn = "${var.bound_profile_arn}"
  inferred_entity_type = "ec2_instance"
  ttl                  = 60
  max_ttl              = 120
  policies             = ["ssl_certificates"]
}
