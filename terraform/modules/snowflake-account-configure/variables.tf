variable "account_parameters_map" {
  description = "map object with account parameters"
}

variable "saml_integration_name" {
  description = "Name for the saml integration"
  default = "OKTA_SAML2_INTEGRATION"
}

variable "saml2_issuer" {
  description = "The string containing the IdP EntityID / Issuer"
  default = "http://www.okta.com/exkiduwtmkTUVFaWH697" #update the saml issuer url for your organization
}

variable "saml2_sso_url" {
  description = "The string containing the IdP SSO URL, where the user should be redirected by Snowflake (the Service Provider) with a SAML AuthnRequest message."
  default = "https://trial-4839041.okta.com/app/snowflake/exkiduwtmkTUVFaWH697/sso/saml" #update sso url for your organization
}

variable "saml2_certificate" {
  description = "The Base64 encoded IdP signing certificate on a single line without the leading -----BEGIN CERTIFICATE----- and ending -----END CERTIFICATE----- markers"
}

variable "saml2_provider" {
  description = "The string describing the IdP. Valid options are: OKTA | ADFS | CUSTOM"
  default = "OKTA"
}

variable "scim_integration_name" {
  description = "Specifies the name of the SAML2 integration"
  default = "OKTA_SCIM_INTEGRATION"
}


variable "is_scim_enabled" {
  description = "Name of the child snowflake account to create"
  default = true
}

variable "scim_client" {
  description = "Name of the child snowflake account to create"
  default = "OKTA"
}

variable "sync_password" {
  description = "Name of the child snowflake account to create"
  default = true
}

variable "run_as_role" {
  description = "Name of the child snowflake account to create"
  default = "OKTA_PROVISIONER"
}

variable "okta_role_comment" {
  description = "Name of the child snowflake account to create"
  default = "OKTA provisioner role"
}

variable "admin_user_list" {
  description = "users to have accountadmin role"
}

variable "allowed_ip_list" {
  description = "ips address allowd to access snowflake account"
}

variable "blocked_ip_list" {
  description = "ips address not allowd to access snowflake account"
}