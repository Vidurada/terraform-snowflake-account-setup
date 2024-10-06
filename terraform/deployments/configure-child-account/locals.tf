locals {
  # config file to consume
  config_data = file(var.config_json_file)
  # read content of the config file
  decoded_details   = jsondecode(local.config_data)
  account_parameters_map = {
    for key, value in local.decoded_details["account_parameters"] : key => {
      val = value
    }
  }
  saml2_certificate = local.decoded_details["saml_certificate"]
  admin_user_list = local.decoded_details["admin_users"]
  blocked_ip_list = local.decoded_details["blocked_ip_list"]
  allowed_ip_list = local.decoded_details["allowed_ip_list"]

}