# terraform-modules

Terraform Modules for infraestructure as code

## Example How to use this modules

```bash
module "resource_group" {
  source     = "git@github.com:AnselmoPfeifer/terraform-modules.git//azure/rg?ref=main"

  resource_group_name     = "rg-${local.config.project}-${local.config.environment}"
  resource_group_location = local.config.region
  resource_group_tags     = local.config.tags
}
```
