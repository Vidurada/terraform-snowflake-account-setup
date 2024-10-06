variable "snowflake_organization" {
    description = "organization of the snowflake accounts"
}

variable "config_json_file" {
  description = "path of the config file to consume"
}

variable "child_account_private_key" {
    description = "private key for the admin user in the created child account"
}