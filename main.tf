resource "azurerm_role_management_policy" "this" {
  role_definition_id = var.role_definition_id
  scope              = var.scope

  dynamic "activation_rules" {
    for_each = try(var.assignment_policy.activation_rules, null) != null ? [1] : []

    content {
      maximum_duration                                   = try(var.assignment_policy.activation_rules.maximum_duration, null)
      require_approval                                   = try(var.assignment_policy.activation_rules.require_approval, null)
      require_justification                              = try(var.assignment_policy.activation_rules.require_justification, null)
      require_multifactor_authentication                 = try(var.assignment_policy.activation_rules.require_multifactor_authentication, null)
      require_ticket_info                                = try(var.assignment_policy.activation_rules.require_ticket_info, null)
      required_conditional_access_authentication_context = try(var.assignment_policy.activation_rules.required_conditional_access_authentication_context, null)

      dynamic "approval_stage" {
        for_each = try(var.assignment_policy.activation_rules.approval_stage, null) != null ? [1] : []

        content {
          dynamic "primary_approver" {
            for_each = try(var.assignment_policy.activation_rules.approval_stage.primary_approver, null) != null ? var.assignment_policy.activation_rules.approval_stage.primary_approver : []

            content {
              object_id = primary_approver.value.object_id
              type      = primary_approver.value.type
            }
          }
        }
      }
    }
  }
  dynamic "active_assignment_rules" {
    for_each = try(var.assignment_policy.active_assignment_rules, null) != null ? [1] : []

    content {
      expiration_required                = try(var.assignment_policy.active_assignment_rules.expiration_required, null)
      expire_after                       = try(var.assignment_policy.active_assignment_rules.expire_after, null)
      require_justification              = try(var.assignment_policy.active_assignment_rules.require_justification, null)
      require_multifactor_authentication = try(var.assignment_policy.active_assignment_rules.require_multifactor_authentication, null)
      require_ticket_info                = try(var.assignment_policy.active_assignment_rules.require_ticket_info, null)
    }
  }
  dynamic "eligible_assignment_rules" {
    for_each = try(var.assignment_policy.eligible_assignment_rules, null) != null ? [1] : []

    content {
      expiration_required = try(var.assignment_policy.eligible_assignment_rules.expiration_required, null)
      expire_after        = try(var.assignment_policy.eligible_assignment_rules.expire_after, null)
    }
  }
  dynamic "notification_rules" {
    for_each = try(var.assignment_policy.notification_rules, null) != null ? [1] : []

    content {
      dynamic "active_assignments" {
        for_each = try(var.assignment_policy.notification_rules.active_assignments, null) != null ? [1] : []

        content {
          dynamic "admin_notifications" {
            for_each = try(var.assignment_policy.notification_rules.active_assignments.admin_notifications, null) != null ? [1] : []

            content {
              default_recipients    = var.assignment_policy.notification_rules.active_assignments.admin_notifications.default_recipients
              notification_level    = var.assignment_policy.notification_rules.active_assignments.admin_notifications.notification_level
              additional_recipients = var.assignment_policy.notification_rules.active_assignments.admin_notifications.additional_recipients
            }
          }
          dynamic "approver_notifications" {
            for_each = try(var.assignment_policy.notification_rules.active_assignments.approver_notifications, null) != null ? [1] : []

            content {
              default_recipients    = var.assignment_policy.notification_rules.active_assignments.approver_notifications.default_recipients
              notification_level    = var.assignment_policy.notification_rules.active_assignments.approver_notifications.notification_level
              additional_recipients = var.assignment_policy.notification_rules.active_assignments.approver_notifications.additional_recipients
            }
          }
          dynamic "assignee_notifications" {
            for_each = try(var.assignment_policy.notification_rules.active_assignments.assignee_notifications, null) != null ? [1] : []

            content {
              default_recipients    = var.assignment_policy.notification_rules.active_assignments.assignee_notifications.default_recipients
              notification_level    = var.assignment_policy.notification_rules.active_assignments.assignee_notifications.notification_level
              additional_recipients = var.assignment_policy.notification_rules.active_assignments.assignee_notifications.additional_recipients
            }
          }
        }
      }
      dynamic "eligible_activations" {
        for_each = try(var.assignment_policy.notification_rules.eligible_activations, null) != null ? [1] : []

        content {
          dynamic "admin_notifications" {
            for_each = try(var.assignment_policy.notification_rules.eligible_activations.admin_notifications, null) != null ? [1] : []

            content {
              default_recipients    = var.assignment_policy.notification_rules.eligible_activations.admin_notifications.default_recipients
              notification_level    = var.assignment_policy.notification_rules.eligible_activations.admin_notifications.notification_level
              additional_recipients = var.assignment_policy.notification_rules.eligible_activations.admin_notifications.additional_recipients
            }
          }
          dynamic "approver_notifications" {
            for_each = try(var.assignment_policy.notification_rules.eligible_activations.approver_notifications, null) != null ? [1] : []

            content {
              default_recipients    = var.assignment_policy.notification_rules.eligible_activations.approver_notifications.default_recipients
              notification_level    = var.assignment_policy.notification_rules.eligible_activations.approver_notifications.notification_level
              additional_recipients = var.assignment_policy.notification_rules.eligible_activations.approver_notifications.additional_recipients
            }
          }
          dynamic "assignee_notifications" {
            for_each = try(var.assignment_policy.notification_rules.eligible_activations.assignee_notifications, null) != null ? [1] : []

            content {
              default_recipients    = var.assignment_policy.notification_rules.eligible_activations.assignee_notifications.default_recipients
              notification_level    = var.assignment_policy.notification_rules.eligible_activations.assignee_notifications.notification_level
              additional_recipients = var.assignment_policy.notification_rules.eligible_activations.assignee_notifications.additional_recipients
            }
          }
        }
      }
      dynamic "eligible_assignments" {
        for_each = try(var.assignment_policy.notification_rules.eligible_assignments, null) != null ? [1] : []

        content {
          dynamic "admin_notifications" {
            for_each = try(var.assignment_policy.notification_rules.eligible_assignments.admin_notifications, null) != null ? [1] : []

            content {
              default_recipients    = var.assignment_policy.notification_rules.eligible_assignments.admin_notifications.default_recipients
              notification_level    = var.assignment_policy.notification_rules.eligible_assignments.admin_notifications.notification_level
              additional_recipients = var.assignment_policy.notification_rules.eligible_assignments.admin_notifications.additional_recipients
            }
          }
          dynamic "approver_notifications" {
            for_each = try(var.assignment_policy.notification_rules.eligible_assignments.approver_notifications, null) != null ? [1] : []

            content {
              default_recipients    = var.assignment_policy.notification_rules.eligible_assignments.approver_notifications.default_recipients
              notification_level    = var.assignment_policy.notification_rules.eligible_assignments.approver_notifications.notification_level
              additional_recipients = var.assignment_policy.notification_rules.eligible_assignments.approver_notifications.additional_recipients
            }
          }
          dynamic "assignee_notifications" {
            for_each = try(var.assignment_policy.notification_rules.eligible_assignments.assignee_notifications, null) != null ? [1] : []

            content {
              default_recipients    = var.assignment_policy.notification_rules.eligible_assignments.assignee_notifications.default_recipients
              notification_level    = var.assignment_policy.notification_rules.eligible_assignments.assignee_notifications.notification_level
              additional_recipients = var.assignment_policy.notification_rules.eligible_assignments.assignee_notifications.additional_recipients
            }
          }
        }
      }
    }
  }

  lifecycle {
    ignore_changes = [
      role_definition_id
    ]
  }
}
