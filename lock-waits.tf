locals {
  lock_waits_filter = coalesce(
    var.lock_waits_filter_override,
    var.filter_str
  )
}

module "lock_waits" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "SQL Server - Lock waits"
  query = "avg(${var.lock_waits_evaluation_period}):max:sqlserver.stats.lock_waits{${local.lock_waits_filter}} by {host} > ${var.lock_waits_critical}"

  alert_message    = "Lock waits on {{host.name}} has increased above {{threshold}} per second ({{value}} per second)"
  recovery_message = "Lock waits on {{host.name}} has recovered ({{value}} per second)"

  # monitor level vars
  enabled            = var.lock_waits_enabled
  alerting_enabled   = var.lock_waits_alerting_enabled
  warning_threshold  = var.lock_waits_warning
  critical_threshold = var.lock_waits_critical
  priority           = var.lock_waits_priority
  docs               = var.lock_waits_docs
  note               = var.lock_waits_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
