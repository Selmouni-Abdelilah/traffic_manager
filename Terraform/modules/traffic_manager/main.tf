resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}
resource "azurerm_traffic_manager_profile" "traffic_profile" {
  name                   = var.profile_name
  resource_group_name    = azurerm_resource_group.rg.name
  traffic_routing_method = "Priority"

  dns_config {
    relative_name = var.name
    ttl           = var.ttl
  }

  monitor_config {
    protocol                     = var.monitor_protocol
    port                         = var.monitor_port
    path                         = var.monitor_path
    interval_in_seconds          = var.monitor_interval
    timeout_in_seconds           = var.monitor_timeout
    tolerated_number_of_failures = var.monitor_failures
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "primary_endpoint" {
  name               = "primary-endpoint"
  profile_id         = azurerm_traffic_manager_profile.traffic_profile.id
  priority           = 1
  weight             = 100
  target_resource_id = var.primary_target_resource_id
}

resource "azurerm_traffic_manager_azure_endpoint" "secondary_endpoint" {
  name               = "secondary-endpoint"
  profile_id         = azurerm_traffic_manager_profile.traffic_profile.id
  priority           = 2
  weight             = 100
  target_resource_id = var.secondary_target_resource_id
}
