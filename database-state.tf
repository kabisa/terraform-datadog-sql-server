locals {
  database_state_filter = coalesce(
    var.database_state_filter_override,
    var.filter_str
  )
}

module "database_state" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.2"

  name  = "SQL Server - Database state"
  query = "max(${var.database_state_evaluation_period}):max:sqlserver.database.state{${local.database_state_filter}} by {host,database,database_state_desc} >= ${var.database_state_critical}"

  alert_message    = "Database {{database.name}} on {{host.name}} is in abnormal state {{database_state_desc.name}}"
  recovery_message = "Database {{database.name}} on {{host.name}} is in back in state {{database_state_desc.name}}"

  # monitor level vars
  enabled            = var.database_state_enabled
  alerting_enabled   = var.database_state_alerting_enabled
  warning_threshold  = var.database_state_warning
  critical_threshold = var.database_state_critical
  priority           = var.database_state_priority
  docs               = var.database_state_docs
  note               = var.database_state_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
