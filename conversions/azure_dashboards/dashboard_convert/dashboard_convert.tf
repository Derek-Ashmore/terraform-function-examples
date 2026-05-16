locals {
  export         = jsondecode(var.dashboard_json)
  dashboard_body = local.export.properties

  lenses = {
    for lens_index, lens in local.dashboard_body.lenses :
    tostring(lens_index) => merge(lens, {
      parts = {
        for part_index, part in lens.parts :
        tostring(part_index) => part
      }
    })
  }

  converted_body = merge(local.dashboard_body, {
    lenses = local.lenses
  })
}
