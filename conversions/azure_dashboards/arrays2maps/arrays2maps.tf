locals {
  export         = jsondecode(var.dashboard_json)
  dashboard_body = local.export.properties

  lenses_normalized = (
    !can(keys(local.dashboard_body.lenses))
    ? { for lens_index, lens in local.dashboard_body.lenses : tostring(lens_index) => lens }
    : local.dashboard_body.lenses
  )

  lenses = {
    for lens_key, lens in local.lenses_normalized :
    lens_key => merge(lens, {
      parts = (
        !can(keys(lens.parts))
        ? { for part_index, part in lens.parts : tostring(part_index) => part }
        : lens.parts
      )
    })
  }

  converted_body = merge(local.dashboard_body, {
    lenses = local.lenses
  })
}
