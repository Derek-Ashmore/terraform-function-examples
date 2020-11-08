locals {
    template = can(data.template_file.init.rendered) ? data.template_file.init.rendered : ""
}

data "template_file" "init" {
  template = try(file("init.tpl"), "")
}

output "test_value" {
    value = local.template
}