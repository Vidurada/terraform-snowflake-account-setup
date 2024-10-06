provider "snowflake" {
  # Configuration options
  account       = var.root_account_name
  authenticator = "JWT"
  user          = var.root_account_username
  role          = "ORGADMIN"
  private_key = var.root_account_private_key
}



