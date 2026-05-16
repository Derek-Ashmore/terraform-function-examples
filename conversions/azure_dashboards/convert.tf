module "dashboard_convert" {
  source = "./dashboard_convert"

  dashboard_json = file("${path.module}/dashboard_sample.json")
}

locals {
  export    = jsondecode(file("${path.module}/dashboard_sample.json"))
  converted = jsondecode(module.dashboard_convert.dashboard_properties)
  lens      = local.converted.lenses["0"]
}

check "lenses_is_map" {
  assert {
    condition     = can(keys(local.converted.lenses))
    error_message = "lenses must be an object after conversion, not a list."
  }
}

check "parts_is_map" {
  assert {
    condition     = can(keys(local.lens.parts))
    error_message = "parts must be an object after conversion, not a list."
  }
}

check "lens_count" {
  assert {
    condition     = length(local.converted.lenses) == length(local.export.properties.lenses)
    error_message = "conversion must not change the number of lenses."
  }
}

check "part_count" {
  assert {
    condition     = length(local.lens.parts) == length(local.export.properties.lenses[0].parts)
    error_message = "conversion must not change the number of parts in lens 0."
  }
}

check "metadata_unchanged" {
  assert {
    condition     = local.converted.metadata == local.export.properties.metadata
    error_message = "metadata must be unchanged by conversion."
  }
}

check "inputs_remain_list" {
  assert {
    condition     = !can(keys(local.lens.parts["0"].metadata.inputs))
    error_message = "metadata.inputs must remain a list."
  }
}

output "verify_lenses_keys" {
  description = "String keys on lenses after conversion."
  value       = keys(local.converted.lenses)
}

output "verify_parts_keys" {
  description = "String keys on parts in lens 0 after conversion."
  value       = keys(local.lens.parts)
}

output "dashboard_properties" {
  description = "Converted dashboard_properties from the module."
  value       = module.dashboard_convert.dashboard_properties
}
