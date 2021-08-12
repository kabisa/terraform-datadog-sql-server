variable "buffer_cache_hit_ratio_enabled" {
  type    = bool
  default = true
}

variable "buffer_cache_hit_ratio_warning" {
  type    = number
  default = 90
}

variable "buffer_cache_hit_ratio_critical" {
  type    = number
  default = 75
}

variable "buffer_cache_hit_ratio_evaluation_period" {
  type    = string
  default = "last_1d"
}

variable "buffer_cache_hit_ratio_note" {
  type    = string
  default = ""
}

variable "buffer_cache_hit_ratio_docs" {
  type    = string
  default = <<-EOT
    When this metric is low, pages are often read from disk. Consider allocating more memory.
  EOT
}

variable "buffer_cache_hit_ratio_filter_override" {
  type    = string
  default = ""
}

variable "buffer_cache_hit_ratio_alerting_enabled" {
  type    = bool
  default = true
}

variable "buffer_cache_hit_ratio_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 4
}
