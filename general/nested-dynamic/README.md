# terraform-function-examples
Example illustrates use of a for_each with a nested dynamic block

## Local run commands

```
az login
terraform init
terraform plan -var-file test.tfvars 
```

Note:  There's no need to "apply". the plan results will show you output consistent with ```test.tfvars``` configuration.