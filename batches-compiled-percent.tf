locals {
  batches_compiled_percent_filter = coalesce(
    var.batches_compiled_percent_filter_override,
    var.filter_str
  )
}

module "batches_compiled_percent" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.2"

  name  = "SQL Server - Percentage of batches requiring compilation"
  query = "avg(${var.batches_compiled_percent_evaluation_period}):(max:sqlserver.stats.sql_compilations{${local.batches_compiled_percent_filter}} by {host} / max:sqlserver.stats.batch_requests{${local.batches_compiled_percent_filter}} by {host}) * 100 >= ${var.batches_compiled_percent_critical}"

  alert_message    = "Database {{database.name}} on {{host.name}} has a high percent of batches requiring compilation"
  recovery_message = "Database {{database.name}} on {{host.name}} has a normal percent of batches requiring compilation"

  # monitor level vars
  enabled            = var.batches_compiled_percent_enabled
  alerting_enabled   = var.batches_compiled_percent_alerting_enabled
  warning_threshold  = var.batches_compiled_percent_warning
  critical_threshold = var.batches_compiled_percent_critical
  priority           = var.batches_compiled_percent_priority
  docs               = var.batches_compiled_percent_docs
  note               = var.batches_compiled_percent_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
