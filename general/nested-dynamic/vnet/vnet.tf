resource "azurerm_resource_group" "resource_group" {
    name        = var.resource_group_name
    location    = var.location
    tags        = var.tags
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
    for_each = each.value.delegations
    content {
      name = delegation.key
      service_delegation {
        name = delegation.value.delegation_name
        actions = delegation.value.delegation_actions
      }
    }
  }

}
