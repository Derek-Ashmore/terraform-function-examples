locals {
    list_iterated_output = templatefile("${path.module}/list-iterator.tmpl", {list = var.sample_list})
    map_usage_output = templatefile("${path.module}/map-usage.tmpl", {map = var.sample_map})
    complex_map_usage_output = templatefile("${path.module}/complex-map-usage.tmpl", {map = var.sample_complex_map})
}

output list_iterated_output {
    value = local.list_iterated_output
}

output map_usage_output {
    value = local.map_usage_output
}

output complex_map_usage_output {
    value = local.complex_map_usage_output
}

