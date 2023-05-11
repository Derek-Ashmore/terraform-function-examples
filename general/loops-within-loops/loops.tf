variable vm_name {}

locals {
    kv_policy_list = distinct(flatten([
        for k,v in var.vm_name : [
            for o in v.object_id_list : {
                name = k
                object_id = o
                key_permission_list = var.vm_name[k]["key_permission_list"]
            }
        ]
    ]))
    kv_policy_map = {
        for v in local.kv_policy_list : "${v.name}.${v.object_id}" => v}
}

output kv_policy_list {
    value = local.kv_policy_list
}

output kv_policy_map {
    value = local.kv_policy_map
}



