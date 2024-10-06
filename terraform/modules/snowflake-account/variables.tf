variable "child_account_name" {
  description = "Name of the child snowflake account to create"
}

variable "child_account_admin_username" {
  description = "admin username of the child account"
}

variable "child_account_admin_email" {
  description = "email of the admin user of the child account"
}

variable "child_account_edition" {
  description = "child snowflake account edition"
}

variable "child_account_comment" {
  description = "a comment"
}

variable "child_account_region" {
  description = "region to create the snowflake account"
}

variable "must_change_password" {
  description = "force admin user to reset password in first login"
  default     = false
}

variable "grace_period_in_days" {
  description = "how many days in grace period when account was deleted"
  default     = 4
}

variable "child_account_public_key" {
  description = "private key for the admin user in the created child account"
}


