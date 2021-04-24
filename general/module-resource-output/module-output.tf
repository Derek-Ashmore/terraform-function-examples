
module "test" {
  source = "./sub-module"
}

output resource_output {
    value = module.test.my_resource
}

output my_resource_id {
  value = module.test.my_resource.id
}