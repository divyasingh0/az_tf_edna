# ══════════════════════════════════════════════════════════════════════════════
# az_terraform_edna/main.tf
# OWNERSHIP : EDNA Application Team
#
# This is the complete infrastructure declaration for the EDNA application.
# It is deliberately minimal — the team supplies business-level values only.
# Everything else (naming, security, tags, governance) is enforced by the
# template and module layers. Nothing else belongs here.
# ══════════════════════════════════════════════════════════════════════════════

# terraform {
#   required_version = ">= 1.3.0"
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~> 3.90"
#     }
#   }
# }

# provider "azurerm" {
#   features {}
# storage_use_azuread = true 
# }
# # ── STORAGE ACCOUNT ──────────────────────────────────────────────────────────
# # Calls the platform-approved storage-account template by pinned Git tag.

module "edna_storage" {
  source = "git::https://github.com/divyasingh0/az_tf_templates.git//templates/stoarge-account?ref=114964617cea3f4e1f68f7f9bf5c53e8c1a1c287"

  # variables...
  app_name            = var.app_name
  environment         = var.environment
  location            = var.location
  resource_group_name = var.resource_group_name

  vnet_address_space  = var.vnet_address_space
  pe_subnet_prefix    = var.pe_subnet_prefix
  dns_servers         = var.dns_servers

  mandatory_tags      = var.mandatory_tags
  optional_tags       = var.optional_tags
  custom_tags         = var.custom_tags
}


 