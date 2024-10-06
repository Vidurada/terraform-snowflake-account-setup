resource "snowflake_account_role" "okta_provisioner_role" {
  name    = var.run_as_role
  comment = var.okta_role_comment
}

resource "snowflake_grant_privileges_to_account_role" "grants_for_okta_provisioner_role" {
  privileges        = ["CREATE ROLE", "CREATE USER"]
  account_role_name = snowflake_account_role.okta_provisioner_role.name
  on_account        = true
}

resource "snowflake_grant_account_role" "okta_provisioner_role_to_account_admin" {
  role_name        = snowflake_account_role.okta_provisioner_role.name
  parent_role_name = "ACCOUNTADMIN"
}

resource "snowflake_account_parameter" "parameters" {
  for_each = var.account_parameters_map
  key = each.key
  value = each.value.val
}

resource "snowflake_saml2_integration" "saml_integration" {
  name            = var.saml_integration_name
  saml2_provider  = var.saml2_provider
  saml2_issuer    = var.saml2_issuer
  saml2_sso_url   = var.saml2_sso_url
  saml2_x509_cert = var.saml2_certificate
}

resource "snowflake_scim_integration" "scim_integration" {
  name          = var.scim_integration_name
  run_as_role = var.run_as_role
  enabled       = var.is_scim_enabled
  scim_client   = var.scim_client
  sync_password = var.sync_password
  depends_on = [ snowflake_grant_account_role.okta_provisioner_role_to_account_admin ]
}

resource "snowflake_user" "admin_users" {
  for_each = var.admin_user_list
  name         = upper(replace(split("@", each.key)[0], ".", ""))
  login_name   = each.key
  comment      = format("Admin user %s", upper(replace(split("@", each.key)[0], ".", "")))
  password     = format("%s@%s", data.snowflake_current_account.current_account.account, upper(replace(split("@", each.key)[0], ".", "")))
  disabled     = false
  display_name = upper(replace(split("@", each.key)[0], ".", ""))
  email        = each.key
  first_name   = upper(replace(split("@", each.key)[0], ".", ""))
  must_change_password = true
}


resource "snowflake_grant_account_role" "assign_accountadmin" {
  for_each = var.admin_user_list
  role_name        = "ACCOUNTADMIN"
  user_name = upper(replace(split("@", each.key)[0], ".", ""))
  depends_on = [ snowflake_user.admin_users ]
}

resource "snowflake_network_policy" "accout_network_policy" {
  name                      = "PP_NETWORK_POLICY"
  allowed_ip_list           = var.allowed_ip_list
  blocked_ip_list           = var.blocked_ip_list
  comment                   = format("Network Policy for %s", data.snowflake_current_account.current_account.account)
}

resource "snowflake_network_policy_attachment" "attach" {
  network_policy_name = snowflake_network_policy.accout_network_policy.name
  set_for_account     = true
}