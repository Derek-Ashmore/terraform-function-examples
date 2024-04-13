# Terraform Documentation Generator Action

This action will use the [Terraform-docs](https://github.com/terraform-docs/terraform-docs/) package to generate Terraform documentation for all projects in the repository.

# Usage

> A Terraform-docs configuration file (e.g. ```.terraform-docs.yml```) must be present.

Either place your Terraform-docs configuration file (```.terraform-docs.yml```) in the root of the repository *or* place one in every Terraform project in the repository.

> Before calling this action, you must check out repository content.

## Supported inputs

| Input Name | Type | Default | Description |
| --- | --- | --- | --- |
| ```push``` | ```boolean``` | ```false``` | If ```true```, pushes generated documentation changes back to the branch. |
| ```config``` | ```string``` | ```.terraform-docs.yml``` | Terraform Docs config file. |
| ```gitUserName``` | ```string``` | ```github-actions[bot]``` | User name to use for git commit and push. |
| ```gitEmail``` | ```string``` | `````` | User email to use for git commit and push. |