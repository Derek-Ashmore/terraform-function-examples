# terraform-function-examples
Example puts together a complex map from sparse inputs

## Local run commands

```
az login
terraform init
terraform plan -var-file test.tfvars 
```

Note:  There's no need to "apply". the plan results will show you output consistent with ```test.tfvars``` configuration.