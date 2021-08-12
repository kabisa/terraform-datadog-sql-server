variable "database_state_enabled" {
  type    = bool
  default = true
}

variable "database_state_warning" {
  type    = number
  default = 1
}

variable "database_state_critical" {
  type    = number
  default = 5
}

variable "database_state_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "database_state_note" {
  type    = string
  default = ""
}

variable "database_state_docs" {
  type    = string
  default = ""
}

variable "database_state_filter_override" {
  type    = string
  default = ""
}

variable "database_state_alerting_enabled" {
  type    = bool
  default = true
}

variable "database_state_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 1
}
