
/************************************************************************************
Resources
************************************************************************************/
resource "aws_appstream_fleet" "this" {
  name = var.fleet_name

  compute_capacity {
    desired_instances = var.desired_instances
  }

  description                        = var.fleet_description
  idle_disconnect_timeout_in_seconds = var.idle_disconnect_timeout_in_seconds
  disconnect_timeout_in_seconds      = var.disconnect_timeout_in_seconds 
  display_name                       = var.fleet_display_name
  enable_default_internet_access     = var.enable_default_internet_access
  fleet_type                         = upper(var.fleet_type)
  image_name                         = var.image_name
  instance_type                      = var.instance_type
  max_user_duration_in_seconds       = var.max_user_duration_in_seconds

  vpc_config {
    security_group_ids = var.security_group_ids
    subnet_ids = var.subnet_ids
  }

  domain_join_info {
    directory_name = var.directory_name
    organizational_unit_distinguished_name = var.organizational_unit_distinguished_name
  }

  tags = var.tags
}

resource "aws_appstream_stack" "this" {
  name         = var.stack_name
  description  = var.stack_description
  display_name = var.stack_display_name
  feedback_url = var.feedback_url
  redirect_url = var.redirect_url

  storage_connectors {
    connector_type = var.connector_type
    domains = var.domains
    resource_identifier = var.resource_identifier
  }

  dynamic "user_settings" {
    for_each = var.user_settings

    content {
      action = upper(each.key)
      permission = upper(user_settings.value.permission)
    }
  }

  application_settings {
    enabled        = var.enabled
    settings_group = var.settings_group
  }

  streaming_experience_settings {
    preferred_protocol = var.preferred_protocol
  }

  tags = var.tags
}

//More than likely will need to be part of a submodule so have finer control over 
//associations
resource "aws_appstream_fleet_stack_association" "this" {
  fleet_name = aws_appstream_fleet.this[0].fleet_name
  stack_name = aws_appstream_stack.this[0].stack_name
}