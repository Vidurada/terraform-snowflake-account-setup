locals {
  # config file to consume
  config_data = file(var.config_json_file)
  # read content of the config file
  decoded_details   = jsondecode(local.config_data)
  account_parameters_map = {
    for key, value in local.decoded_details["account_parameters"] : key => value
  }
}