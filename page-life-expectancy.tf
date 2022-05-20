locals {
  page_life_expectancy_filter = coalesce(
    var.page_life_expectancy_filter_override,
    var.filter_str
  )
}

module "page_life_expectancy" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name  = "SQL Server - Page life expectancy"
  query = "avg(${var.page_life_expectancy_evaluation_period}):min:sqlserver.buffer.page_life_expectancy{${local.page_life_expectancy_filter}} by {host} < ${var.page_life_expectancy_critical}"

  alert_message    = "Page life expectancy of {{database.name}} on {{host.name}} has dropped below {{threshold}} ({{value}})"
  recovery_message = "Page life expectancy of {{database.name}} on {{host.name}} has recovered ({{value}})"

  # monitor level vars
  enabled            = var.page_life_expectancy_enabled
  alerting_enabled   = var.page_life_expectancy_alerting_enabled
  warning_threshold  = var.page_life_expectancy_warning
  critical_threshold = var.page_life_expectancy_critical
  priority           = var.page_life_expectancy_priority
  docs               = var.page_life_expectancy_docs
  note               = var.page_life_expectancy_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
