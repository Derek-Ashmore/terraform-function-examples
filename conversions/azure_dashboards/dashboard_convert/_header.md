# Azure Dashboard convert

Converts a full Azure Portal dashboard export so `azurerm_portal_dashboard.dashboard_properties` accepts it. List/tuple `lenses` and `parts` become objects keyed by index strings (`"0"`, `"1"`, …); all other fields are unchanged.
