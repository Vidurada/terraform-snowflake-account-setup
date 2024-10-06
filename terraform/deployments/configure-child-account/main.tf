module "configure_account" {
    source = "../../modules/snowflake-account-configure"
    account_parameters_map = local.account_parameters_map
    saml2_certificate = local.saml2_certificate
    admin_user_list = toset(local.admin_user_list)
    blocked_ip_list = toset(local.blocked_ip_list)
    allowed_ip_list = toset(local.allowed_ip_list)
}