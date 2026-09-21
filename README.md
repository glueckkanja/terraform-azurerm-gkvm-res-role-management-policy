<!-- BEGIN_TF_DOCS -->
# terraform-azurem-gkvm-res-role-management-policy

This is a Terraform resource module to manage a AzureRM Role Management Policy.

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9, < 2.0)

- <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) (~> 2.4)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 4.40)

- <a name="requirement_modtm"></a> [modtm](#requirement\_modtm) (~> 0.3)

- <a name="requirement_random"></a> [random](#requirement\_random) (~> 3.5)

## Resources

The following resources are used by this module:

- [azurerm_role_management_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_management_policy) (resource)
- [modtm_telemetry.telemetry](https://registry.terraform.io/providers/azure/modtm/latest/docs/resources/telemetry) (resource)
- [random_uuid.telemetry](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) (resource)
- [azapi_client_config.telemetry](https://registry.terraform.io/providers/Azure/azapi/latest/docs/data-sources/client_config) (data source)
- [modtm_module_source.telemetry](https://registry.terraform.io/providers/azure/modtm/latest/docs/data-sources/module_source) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_assignment_policy"></a> [assignment\_policy](#input\_assignment\_policy)

Description: The assignment policy configuration for the role management policy.

Type:

```hcl
object({
    activation_rules = optional(object({
      maximum_duration                                   = optional(string)
      require_approval                                   = optional(bool)
      require_justification                              = optional(bool)
      require_multifactor_authentication                 = optional(bool)
      require_ticket_info                                = optional(bool)
      required_conditional_access_authentication_context = optional(bool)
      approval_stage = optional(object({
        primary_approver = optional(list(object({
          object_id = string
          type      = string
        })))
      }))
    }))
    active_assignment_rules = optional(object({
      expiration_required                = optional(bool)
      expire_after                       = optional(string)
      require_justification              = optional(bool)
      require_multifactor_authentication = optional(bool)
      require_ticket_info                = optional(bool)
    }))
    eligible_assignment_rules = optional(object({
      expiration_required = optional(bool)
      expire_after        = optional(string)
    }))
    notification_rules = optional(object({
      active_assignments = optional(object({
        admin_notifications = optional(object({
          additional_recipients = optional(list(string))
          default_recipients    = bool
          notification_level    = string
        }))
        approver_notifications = optional(object({
          additional_recipients = optional(list(string))
          default_recipients    = bool
          notification_level    = string
        }))
        assignee_notifications = optional(object({
          additional_recipients = optional(list(string))
          default_recipients    = bool
          notification_level    = string
        }))
      }))
      eligible_activations = optional(object({
        admin_notifications = optional(object({
          additional_recipients = optional(list(string))
          default_recipients    = bool
          notification_level    = string
        }))
        approver_notifications = optional(object({
          additional_recipients = optional(list(string))
          default_recipients    = bool
          notification_level    = string
        }))
        assignee_notifications = optional(object({
          additional_recipients = optional(list(string))
          default_recipients    = bool
          notification_level    = string
        }))
      }))
      eligible_assignments = optional(object({
        admin_notifications = optional(object({
          additional_recipients = optional(list(string))
          default_recipients    = bool
          notification_level    = string
        }))
        approver_notifications = optional(object({
          additional_recipients = optional(list(string))
          default_recipients    = bool
          notification_level    = string
        }))
        assignee_notifications = optional(object({
          additional_recipients = optional(list(string))
          default_recipients    = bool
          notification_level    = string
        }))
      }))
    }))
  })
```

### <a name="input_role_definition_id"></a> [role\_definition\_id](#input\_role\_definition\_id)

Description: The role definition ID that the policy applies to.

Type: `string`

### <a name="input_scope"></a> [scope](#input\_scope)

Description: The scope at which to apply the role management policy.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: This variable controls whether or not telemetry is enabled for the module.  
For more information see <https://aka.ms/avm/telemetryinfo>.  
If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `false`

## Outputs

The following outputs are exported:

### <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id)

Description: The resource ID of the role management policy.

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->