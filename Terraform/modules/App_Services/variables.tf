variable "rg_name" {
  description = "Name for the resource group"
  type        = string
}

variable "location" {
  description = "Location for the resource group"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name for the App Service Plan"
  type        = string
}

variable "app_service_name" {
  description = "Name for the App Service"
  type        = string
}

variable "repo_url" {
  description = "URL of the Git repository"
  type        = string
}

variable "branch" {
  description = "Branch of the Git repository"
  type        = string
}
