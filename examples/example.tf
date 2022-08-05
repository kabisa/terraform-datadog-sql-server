# tflint-ignore: terraform_module_version
module "sql_server" {
  source = "kabisa/sql-server/datadog"

  notification_channel       = "@mail@example.com"
  service                    = "SQL Server"
  env                        = "prd"
  filter_str                 = "role:sqlserver"
  service_check_include_tags = ["role:sqlserver"]
}
