module "module_base" {
  source = "git::https://github.com/Derek-Ashmore/terraform-function-examples.git?ref=0.0.1"
}

module "test" {
  source = "./.terraform/modules/module_base/general/collection-ops"
}

output "last_node" {
    value = module.test.last_node
}