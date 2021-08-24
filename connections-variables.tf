variable "connections_enabled" {
  type    = bool
  default = true
}

variable "connections_warning" {
  type    = number
  default = 400
}

variable "connections_critical" {
  type    = number
  default = 500
}

variable "connections_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "connections_note" {
  type    = string
  default = ""
}

variable "connections_docs" {
  type    = string
  default = ""
}

variable "connections_filter_override" {
  type    = string
  default = ""
}

variable "connections_alerting_enabled" {
  type    = bool
  default = true
}

variable "connections_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
