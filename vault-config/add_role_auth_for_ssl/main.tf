
resource "vault_aws_auth_backend_role" "instance_backend_role" {
  role                 = "vetservices"
  auth_type            = "ec2"
  bound_iam_instance_profile_arn = "${var.bound_profile_arn}"
  ttl                  = 60
  max_ttl              = 120
  policies             = ["ssl_certificates"]
}
