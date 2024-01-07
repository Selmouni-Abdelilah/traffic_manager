variable "name" {
  description = "Relative name for DNS configuration"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}
variable "location" {
  description = "Locationn of the resource group"
  type        = string
}

variable "profile_name" {
  description = "Name of the Traffic Manager profile"
  type        = string
}

variable "ttl" {
  description = "Time to live for DNS records"
  type        = number
}

variable "monitor_protocol" {
  description = "Protocol used for monitoring"
  type        = string
}

variable "monitor_port" {
  description = "Port used for monitoring"
  type        = number
}

variable "monitor_path" {
  description = "Path used for monitoring"
  type        = string
}

variable "monitor_interval" {
  description = "Interval in seconds for monitoring"
  type        = number
}

variable "monitor_timeout" {
  description = "Timeout in seconds for monitoring"
  type        = number
}

variable "monitor_failures" {
  description = "Number of tolerated failures for monitoring"
  type        = number
}

variable "primary_target_resource_id" {
  description = "ID of the primary target resource (e.g., App Service)"
  type        = string
}

variable "secondary_target_resource_id" {
  description = "ID of the secondary target resource (e.g., App Service)"
  type        = string
}
