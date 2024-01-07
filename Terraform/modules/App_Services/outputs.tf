output "webapp_name" {
  value       = azurerm_app_service.webapp.default_site_hostname
  description = "The default hostname of the web app."
}
output "id" {
  value       = azurerm_app_service.webapp.id
  description = "The ID of the web app."
}