terraform {
  required_version = ">= 1.9, < 2.0"

  required_providers {
    modtm = {
      source  = "azure/modtm"
      version = "~> 0.3"
    }
  }
}

provider "modtm" {
  enabled = false
}

module "role_management_policy" {
  source = "../../"

  assignment_policy  = var.assignment_policy
  role_definition_id = var.role_definition_id
  scope              = var.scope
  enable_telemetry   = var.enable_telemetry
}
