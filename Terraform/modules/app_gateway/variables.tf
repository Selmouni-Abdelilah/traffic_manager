variable "name" {
  description = "Name for the Application Gateway"
  type        = string
}
variable "rg_name" {
  description = "Name for the Resource Group"
  type        = string
}

variable "location" {
  description = "Location for the Application Gateway"
  type        = string
}

variable "vnet_subnet_id" {
  description = "ID of the VNet Subnet for the Application Gateway"
  type        = string
}

variable "public_ip_id" {
  description = "ID of the Public IP for the Application Gateway"
  type        = string
}

variable "app_service_fqdn" {
  description = "FQDN of the App Service to be used in the Application Gateway configuration"
  type        = string
}
