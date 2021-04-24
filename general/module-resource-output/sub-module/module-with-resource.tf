resource null_resource example {
  provisioner "local-exec" {
    command = "echo Hi there!"
  }
}

output my_resource {
  value = null_resource.example
}