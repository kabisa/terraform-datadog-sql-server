variable "procs_blocked_enabled" {
  type    = bool
  default = true
}

variable "procs_blocked_warning" {
  type    = number
  default = null
}

variable "procs_blocked_critical" {
  type    = number
  default = 1
}

variable "procs_blocked_evaluation_period" {
  type    = string
  default = "last_10m"
}

variable "procs_blocked_note" {
  type    = string
  default = ""
}

variable "procs_blocked_docs" {
  type    = string
  default = <<-EOT
    High number of procs blocked can indicate deadlocks. Check for deadlocks by investigating which queries are waiting for locks to be released.
  EOT
}

variable "procs_blocked_filter_override" {
  type    = string
  default = ""
}

variable "procs_blocked_alerting_enabled" {
  type    = bool
  default = true
}

variable "procs_blocked_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
