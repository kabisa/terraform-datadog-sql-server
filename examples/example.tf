module "kubernetes" {
  source = "kabisa/sql-server/datadog"

  notification_channel       = "mail@example.com"
  service                    = "SQL Server"
  env                        = "prd"
  alert_env                  = "prd"
  filter_str                 = "role:sqlserver"
  service_check_include_tags = ["role:sqlserver"]
}