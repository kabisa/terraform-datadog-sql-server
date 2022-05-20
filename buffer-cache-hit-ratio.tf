locals {
  buffer_cache_hit_ratio_filter = coalesce(
    var.buffer_cache_hit_ratio_filter_override,
    var.filter_str
  )
}

module "buffer_cache_hit_ratio" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name  = "SQL Server - Buffer cache hit ratio"
  query = "avg(${var.buffer_cache_hit_ratio_evaluation_period}):min:sqlserver.buffer.cache_hit_ratio{${local.buffer_cache_hit_ratio_filter}} by {host} * 100 < ${var.buffer_cache_hit_ratio_critical}"

  alert_message    = "Buffer cache hit ratio on {{host.name}} has increased above {{threshold}} ({{value}})"
  recovery_message = "Buffer cache hit ratio on {{host.name}} has recovered ({{value}})"

  # monitor level vars
  enabled            = var.buffer_cache_hit_ratio_enabled
  alerting_enabled   = var.buffer_cache_hit_ratio_alerting_enabled
  warning_threshold  = var.buffer_cache_hit_ratio_warning
  critical_threshold = var.buffer_cache_hit_ratio_critical
  priority           = var.buffer_cache_hit_ratio_priority
  docs               = var.buffer_cache_hit_ratio_docs
  note               = var.buffer_cache_hit_ratio_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
