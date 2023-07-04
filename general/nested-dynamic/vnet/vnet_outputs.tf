
output "resource_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_name"{
  value = azurerm_virtual_network.vnet.name
}

output "subnets" {
  value = azurerm_virtual_network.vnet.subnet
}

output "vnet" {
  value = azurerm_virtual_network.vnet
}

output "subnets_name_id_map" {
  value = {for s in azurerm_virtual_network.vnet.subnet : s.name => s.id}
}

output "subnet_delegation_map" {
  value = local.subnet_delegation_map
}