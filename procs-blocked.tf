locals {
  procs_blocked_filter = coalesce(
    var.procs_blocked_filter_override,
    var.filter_str
  )
}

module "procs_blocked" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.2"

  name  = "SQL Server - Lock waits"
  query = "avg(${var.procs_blocked_evaluation_period}):max:sqlserver.stats.procs_blocked{${local.procs_blocked_filter}} by {host} >= ${var.procs_blocked_critical}"

  alert_message    = "Procs blocked on {{host.name}} has increased above {{threshold}} per second ({{value}} per second)"
  recovery_message = "Procs blocked on {{host.name}} has recovered ({{value}} per second)"

  # monitor level vars
  enabled            = var.procs_blocked_enabled
  alerting_enabled   = var.procs_blocked_alerting_enabled
  warning_threshold  = var.procs_blocked_warning
  critical_threshold = var.procs_blocked_critical
  priority           = var.procs_blocked_priority
  docs               = var.procs_blocked_docs
  note               = var.procs_blocked_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
