locals {
    url         = "https://zsprod.blob.core.windows.net/nss/znss_4_0_4_osdisk.vhd"
    split_array = split("/", local.url)
    offset      = length(local.split_array) - 1
    last_node = element(local.split_array, local.offset)
}

output "split_array" {
    value = local.split_array
}

output "offset" {
    value = local.offset
}

output "last_node" {
    value = local.last_node
}