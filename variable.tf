variable "app_name" {
  description = "Application identifier. Lowercase alphanumeric only. Must match the name registered with the Platform Engineering team."
  type        = string
  default     = "edna"
}

variable "environment" {
  description = "Deployment environment: dev | test | prod. Supplied via .tfvars at pipeline runtime."
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "environment must be one of: dev, test, prod."
  }
}

variable "location" {
  description = "Azure region for this workload. E.g. eastus2, uksouth. Supplied via .tfvars."
  type        = string
}

