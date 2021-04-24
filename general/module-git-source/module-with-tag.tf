module "test" {
  source = "git::https://github.com/Derek-Ashmore/terraform-function-examples.git//general/collection-ops?ref=0.0.1"
}

output "last_node" {
    value = module.test.last_node
}