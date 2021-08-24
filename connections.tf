locals {
  connections_filter = coalesce(
    var.connections_filter_override,
    var.filter_str
  )
}

module "connections" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.2"

  name  = "SQL Server - Connections"
  query = "avg(${var.connections_evaluation_period}):max:sqlserver.stats.connections{${local.connections_filter}} by {host} >= ${var.connections_critical}"

  alert_message    = "Unusual high number of SQL Server connections on {{host.name}} has increased above {{threshold}} current connection count: ({{value}}"
  recovery_message = "Number of SQL Server connections of {{host.name}} has recovered ({{value}}"

  # monitor level vars
  enabled            = var.connections_enabled
  alerting_enabled   = var.connections_alerting_enabled
  warning_threshold  = var.connections_warning
  critical_threshold = var.connections_critical
  priority           = var.connections_priority
  docs               = var.connections_docs
  note               = var.connections_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
