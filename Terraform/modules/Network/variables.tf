variable "rg_name" {
  description = "Name for the resource group"
  type        = string
}

variable "location" {
  description = "Location for the resource group"
  type        = string
}

variable "vnet_name" {
  description = "Name for the virtual network"
  type        = string
}

variable "public_ip_name" {
  description = "Name for the public IP"
  type        = string
}

variable "domain_name" {
  description = "Domaine Name for the public IP"
  type        = string
}