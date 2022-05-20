module "can_connect" {
  source  = "kabisa/service-check-monitor/datadog"
  version = "1.4.1"

  name         = "SQL Server - Can connect"
  metric_name  = "sqlserver.can_connect"
  by_tags      = ["host", "db"]
  include_tags = local.service_check_include_tags
  exclude_tags = local.service_check_exclude_tags

  alert_message    = "Can not connect to database {{database.name}} on {{host.name}}"
  recovery_message = "Can connect to database {{database.name}} on {{host.name}}"

  # monitor level vars
  enabled            = var.can_connect_enabled
  alerting_enabled   = var.can_connect_alerting_enabled
  warning_threshold  = var.can_connect_warning
  critical_threshold = var.can_connect_critical
  priority           = var.can_connect_priority
  docs               = var.can_connect_docs
  note               = var.can_connect_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
