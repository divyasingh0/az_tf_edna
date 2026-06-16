# ══════════════════════════════════════════════════════════════════════════════
# az_terraform_edna/main.tf
# OWNERSHIP : EDNA Application Team
#
# This is the complete infrastructure declaration for the EDNA application.
# It is deliberately minimal — the team supplies business-level values only.
# Everything else (naming, security, tags, governance) is enforced by the
# template and module layers. Nothing else belongs here.
# ══════════════════════════════════════════════════════════════════════════════

terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90"
    }
  }
}

provider "azurerm" {
  features {}
  # Authentication is via OIDC Workload Identity Federation in CI/CD.
  # Never use client_secret here.
}

# ── STORAGE ACCOUNT ──────────────────────────────────────────────────────────
# Calls the platform-approved storage-account template by pinned Git tag.


module "edna_storage" {
source = "https://github.com/divyasingh0/az_tf_templates/tree/eab6fc8c8d5ae362f3a94bb4579b4102fb31d6b8/templates/stoarge-account"

  # ── Who we are (business identity) ────────────────────────────────────────
  app_name    = var.app_name
  environment = var.environment
  location    = var.location
  
}


