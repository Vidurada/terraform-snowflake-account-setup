module "child_account" {
    source = "../../modules/snowflake-account"
    child_account_name  = local.decoded_details["account_name"]
    child_account_region = local.decoded_details["region"]
    child_account_edition = local.decoded_details["edition"]
    child_account_admin_username = local.decoded_details["admin_username"]
    child_account_admin_email = local.decoded_details["admin_email"]
    child_account_public_key = var.child_account_public_key
    child_account_comment = local.decoded_details["comment"]
}