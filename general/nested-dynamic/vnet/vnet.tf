locals {
  subnet_nsg_map = {for s,v in var.subnet_map : s => v.network_security_group_id if v.network_security_group_id != null}
  subnet_delegation_map = {for s,v in var.subnet_map : s => v.delegations if v.delegations != null}
}

resource "azurerm_resource_group" "resource_group" {
    name        = var.resource_group_name
    location    = var.location
    tags        = var.tags
}

resource "azurerm_network_watcher" "networkwatcher" {
  count               = var.create_network_watcher ? 1 : 0
  name                = "NetworkWatcher-TEST"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  tags                = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  address_space       = var.vnet_cidr
  dns_servers         = var.dns_servers

  tags = var.tags
}

resource "azurerm_subnet" "subnet" {
  for_each                                       = var.subnet_map

  name                                           = each.key
  resource_group_name                            = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  service_endpoints                              = each.value.service_endpoints
  address_prefixes                               = each.value.address_prefixes
  enforce_private_link_endpoint_network_policies = each.value.enforce_private_link_endpoint_network_policies

  dynamic "delegation" {
    #for_each = each.value["delegations"]
    for_each = try(var.subnet_map[each.key]["delegations"], {})
    content {
      name = delegation.key
      service_delegation {
        name = delegation.value.delegation_name
        actions = delegation.value.delegation_actions
      }
    }
  }

}

resource "azurerm_subnet_network_security_group_association" "nsg_subnet" {
  for_each = local.subnet_nsg_map
  
  subnet_id                 = azurerm_subnet.subnet[each.key].id
  network_security_group_id = each.value
}

resource "azurerm_monitor_diagnostic_setting" "network" {
  name               = "LOGANALYTICS-DIAGNOSTICS"
  count              = var.log_analytics_workspace_id != null ? 1 : 0
  target_resource_id = azurerm_virtual_network.vnet.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  log {
    category = "VMProtectionAlerts"
    enabled  = true

    retention_policy {
      enabled = true
      days    = var.log_retention_policy_days
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
      days    = var.log_retention_policy_days
    }
  }
}

