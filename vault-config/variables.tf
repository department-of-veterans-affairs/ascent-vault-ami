# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "git_access_token" {
  description = "Github access token with access to external configuration repository"
}

variable "sonar_git_access_token" {
  description = "Github access token Sonar will use to comment on Github Pull Requests"
}

variable "jwt_secret_token" {
  description = "Pre-shared JWT access token used to authentication clients."
}

variable "bgs_password" {
  description = "Password to be used by our micro-services to authenticate with BGS services. To be supplied by BGS."
}

variable "vbms_private_key_file" {
  description = "Path to private key for VBMS client certificate. Should be in PEM format"
}

variable "role_arn" {
  description = "The ARN of the role that the EC2 Instance will have when making requests to vault"
}

variable "profile_arn" {
  description = "The ARN of the profile that the EC2 Instance will assume while making requests to vault"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults, but can be overriden to customize this module.
# ---------------------------------------------------------------------------------------------------------------------

variable "bgs_username" {
  description = "Username to be used by our micro-services to authenticate with BGS services. To be supplied by BGS."
  default = ""
}

variable "ca_common_name" {
  description = "Common name used for the generated CA certificate"
  default = "internal.vetservices.gov"
}
