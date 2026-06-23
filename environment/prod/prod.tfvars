# ══════════════════════════════════════════════════════════════════════════════
# az_terraform_edna/environments/prod/prod.tfvars
# Provided by platform team — do not guess or hardcode these values.
# ══════════════════════════════════════════════════════════════════════════════

# ══════════════════════════════════════════════════════════════════════════════
# az_terraform_edna/environments/prod/prod.tfvars
# Provided by platform team — do not guess or hardcode these values.
# ══════════════════════════════════════════════════════════════════════════════


app_name            = "edna"
environment         = "prod"
location            = "eastus2"
resource_group_name = "rg-edna-dev"

vnet_address_space  = "10.10.0.0/16"
pe_subnet_prefix    = "10.10.1.0/24"

mandatory_tags = {
  environment_type    = "Development"
  department          = "EDNA"
  owner_email         = "edna@burlington.com"
  tool                = "Terraform"
  terraform           = "true"
  app                 = "EDNA"
  change_notification = "Email:edna@burlington.com+Teams:edna"
  maintenance_window  = "sun-00:00-04:00"
  criticality         = "medium"
  data_classification = "official-use"
}

optional_tags = {}

custom_tags = {
  cost-center = "12345"
}