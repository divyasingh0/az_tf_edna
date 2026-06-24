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
variable "resource_group_name" {
  description = "Resource Group name to create and deploy the Storage Account into. E.g. rg-edna-prod-eus2-001"
  type        = string
}
variable "location" {
  description = "Azure region for this workload. E.g. eastus2, uksouth. Supplied via .tfvars."
  type        = string
}

variable "private_endpoint_subnet_name" {

  description = "Subnet where storage private endpoint will be deployed"

  type = string
}

variable "vnet_address_space" {
  description = "CIDR block for the VNet. E.g. 10.0.0.0/16"
  type        = string
}



variable "dns_servers" {
  description = "Optional custom DNS servers."
  type        = list(string)
  default     = []
}

variable "mandatory_tags" {
  description = "Mandatory governance tags"

  type = object({
    environment_type    = string
    department          = string
    owner_email         = string
    tool                = string
    terraform           = string
    app                 = string
    change_notification = string
    maintenance_window  = string
    criticality         = string
    data_classification = string
  })
}

variable "optional_tags" {
  description = "Optional tags"
  type        = map(string)
  default     = {}
}

variable "custom_tags" {
  description = "Custom tags"
  type        = map(string)
  default     = {}
}

variable "pe_subnet_prefix" {
  type = string
}
