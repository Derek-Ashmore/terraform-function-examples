variable my_map {
    default = {
        key1 = "value1"
    }
}

locals {
    test_value = try(var.my_map["key2"], "")
}

output "test_value" {
    value = local.test_value
}