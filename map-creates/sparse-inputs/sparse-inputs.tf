locals {
    subnets     = keys(var.subnet_cidr_map)
    empty_array = []

    subnet_attribute_map = {
        for subnet in local.subnets:
            subnet => {
                cidr = var.subnet_cidr_map[subnet]                                              # Required value
                services = lookup(var.subnet_service_endpoint_map, subnet, local.empty_array)   # Optional value
                offset = subnet == local.subnets[0] ? 0 : 1
            }
    }

    subnet_attribute_list = {
        for subnet in local.subnets:
            subnet => lookup(var.subnet_service_endpoint_map, subnet, local.empty_array)
    }
}

output subnets {
    value = local.subnets
}

output subnet_attribute_map {
    value = local.subnet_attribute_map
}

output subnet_attribute_list {
    value = local.subnet_attribute_list
}