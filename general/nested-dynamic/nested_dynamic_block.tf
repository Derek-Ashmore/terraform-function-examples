
variable vnet_map {}
variable subscription_id {}
variable tenant_id {}

module vnet {
    source = "./vnet"

    for_each = var.vnet_map

    resource_group_name = "test_rg"
    location = "centralus"
    vnet_cidr = each.value.address_space

    vnet_name = each.key
    subnet_map = each.value.subnet_map

    tags = {
        environment = "test"
    }
}