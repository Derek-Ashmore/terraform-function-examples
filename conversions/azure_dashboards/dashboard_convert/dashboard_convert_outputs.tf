output "dashboard_properties" {
  description = "Dashboard body JSON for azurerm_portal_dashboard.dashboard_properties."
  value       = jsonencode(local.converted_body)
}
