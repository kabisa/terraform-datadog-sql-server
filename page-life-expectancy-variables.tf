variable "page_life_expectancy_enabled" {
  type    = bool
  default = true
}

variable "page_life_expectancy_warning" {
  type    = number
  default = 1800
}

variable "page_life_expectancy_critical" {
  type    = number
  default = 900
}

variable "page_life_expectancy_evaluation_period" {
  type    = string
  default = "last_1d"
}

variable "page_life_expectancy_note" {
  type    = string
  default = ""
}

variable "page_life_expectancy_docs" {
  type    = string
  default = <<-EOT
    When this metric is low, pages are not being cached for a short time and often read from disk. Consider allocating more memory.
  EOT
}

variable "page_life_expectancy_filter_override" {
  type    = string
  default = ""
}

variable "page_life_expectancy_alerting_enabled" {
  type    = bool
  default = true
}

variable "page_life_expectancy_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 4
}
