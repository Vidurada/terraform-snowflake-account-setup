resource "snowflake_account" "child_account" {
  name                 = var.child_account_name
  admin_name           = var.child_account_admin_username
  admin_rsa_public_key = var.child_account_public_key
  email                = var.child_account_admin_email
  must_change_password = var.must_change_password
  edition              = var.child_account_edition
  comment              = var.child_account_comment
  region               = var.child_account_region
  grace_period_in_days = var.grace_period_in_days
}

