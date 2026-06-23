# ══════════════════════════════════════════════════════════════════════════════
# az_terraform_edna/output.tf
# OWNERSHIP : EDNA Application Team
# ══════════════════════════════════════════════════════════════════════════════

output "storage_account_name" {
  description = "Auto-generated storage account name. Derived from org naming convention — the app team does not choose this."
  value       = module.edna_storage.storage_account_name_generated
}

output "storage_account_ids" {
  description = "Map of storage account name => Azure Resource ID."
  value       = module.edna_storage.storage_account_ids
}

output "storage_account_primary_blob_endpoints" {
  description = "Map of storage account name => primary blob endpoint. Use this in application configuration."
  value       = module.edna_storage.storage_account_primary_blob_endpoints
}

output "resource_group_name" {
  description = "Auto-generated resource group name for this workload."
  value       = module.edna_storage.resource_group_name_generated
}


