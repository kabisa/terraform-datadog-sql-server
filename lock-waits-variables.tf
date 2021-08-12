variable "lock_waits_enabled" {
  type    = bool
  default = true
}

variable "lock_waits_warning" {
  type    = number
  default = 10
}

variable "lock_waits_critical" {
  type    = number
  default = 20
}

variable "lock_waits_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "lock_waits_note" {
  type    = string
  default = ""
}

variable "lock_waits_docs" {
  type    = string
  default = <<-EOT
    High numbers of lock waits per second is caused by lock contention. Try reducing lock contention by using more fine grained locking in the queries.
  EOT
}

variable "lock_waits_filter_override" {
  type    = string
  default = ""
}

variable "lock_waits_alerting_enabled" {
  type    = bool
  default = true
}

variable "lock_waits_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 4
}
