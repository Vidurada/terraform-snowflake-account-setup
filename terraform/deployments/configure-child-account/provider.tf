provider "snowflake" {
  # Configuration options
  account       = format("%s-%s",var.snowflake_organization, local.decoded_details["account_name"])
  authenticator = "JWT"
  user          = local.decoded_details["admin_username"]
  role          = "ACCOUNTADMIN"
  private_key = var.child_account_private_key
}
