# Terraform Formatting Action

This action will use the [Terraform fmt](https://developer.hashicorp.com/terraform/cli/commands/fmt) utility to format all Terraform code in the repository.

# Usage

> Before calling this action, you must check out repository content.

## Supported inputs

| Input Name | Type | Default | Description |
| --- | --- | --- | --- |
| ```push``` | ```boolean``` | ```false``` | If ```true```, pushes generated documentation changes back to the branch. |
| ```version``` | ```string``` | ```1.8.0``` | Terraform version. |
| ```gitUserName``` | ```string``` | ```github-actions[bot]``` | User name to use for git commit and push. |
| ```gitEmail``` | ```string``` | `````` | User email to use for git commit and push. |