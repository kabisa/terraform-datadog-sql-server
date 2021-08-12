variable "batches_compiled_percent_enabled" {
  type    = bool
  default = true
}

variable "batches_compiled_percent_warning" {
  type    = number
  default = 10
}

variable "batches_compiled_percent_critical" {
  type    = number
  default = 20
}

variable "batches_compiled_percent_evaluation_period" {
  type    = string
  default = "last_1d"
}

variable "batches_compiled_percent_note" {
  type    = string
  default = ""
}

variable "batches_compiled_percent_docs" {
  type    = string
  default = <<-EOT
    When this metric is high, a lot of queries need to be recompiled. Consider parameterizing more queries by using stored procedures, using forced parameterization or allocating more memory.
  EOT
}

variable "batches_compiled_percent_filter_override" {
  type    = string
  default = ""
}

variable "batches_compiled_percent_alerting_enabled" {
  type    = bool
  default = true
}

variable "batches_compiled_percent_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 4
}
