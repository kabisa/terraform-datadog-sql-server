variable "can_connect_enabled" {
  type    = bool
  default = true
}

variable "can_connect_alerting_enabled" {
  type    = bool
  default = true
}

variable "can_connect_warning" {
  type    = number
  default = 1
}

variable "can_connect_critical" {
  type    = number
  default = 1
}

variable "can_connect_priority" {
  type    = number
  default = 1
}

variable "can_connect_docs" {
  type    = string
  default = ""
}

variable "can_connect_note" {
  type    = string
  default = ""
}
