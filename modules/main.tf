
/************************************************************************************
Resources
************************************************************************************/
resource "aws_appstream_directory_config" "this" {
  directory_name                          = var.directory_name
  organizational_unit_distinguished_names = var.organizational_unit_distinguished_names

  service_account_credentials {
    account_name     = var.account_name
    account_password = var.account_password
  }
}

resource "aws_appstream_image_builder" "this" {
  name                           = "Name"
  description                    = "Description of a ImageBuilder"
  display_name                   = "Display name of a ImageBuilder"
  enable_default_internet_access = false
  image_name                     = "AppStream-WinServer2019-10-05-2022"
  instance_type                  = "stream.standard.large"

  vpc_config {
    subnet_ids = [aws_subnet.example.id]
  }

  tags = {
    Name = "Example Image Builder"
  }
}

resource "aws_appstream_fleet" "this" {
  name = "test-fleet"

  compute_capacity {
    desired_instances = 1
  }

  description                        = "test fleet"
  idle_disconnect_timeout_in_seconds = 60
  display_name                       = "test-fleet"
  enable_default_internet_access     = false
  fleet_type                         = "ON_DEMAND"
  image_name                         = "Amazon-AppStream2-Sample-Image-03-11-2023"
  instance_type                      = "stream.standard.large"
  max_user_duration_in_seconds       = 600

  vpc_config {
    subnet_ids = ["subnet-06e9b13400c225127"]
  }

  domain_join_info {
    directory_name = "test domain"
    organizational_unit_distinguished_name = "CN"
  }

  tags = {
    TagName = "tag-value"
  }
}

resource "aws_appstream_fleet_stack_association" "example" {
  fleet_name = aws_appstream_fleet.example.name
  stack_name = aws_appstream_stack.example.name
}

resource "aws_appstream_stack" "example" {
  name         = "stack name"
  description  = "stack description"
  display_name = "stack display name"
  feedback_url = "http://your-domain/feedback"
  redirect_url = "http://your-domain/redirect"

  storage_connectors {
    connector_type = "HOMEFOLDERS"
  }

  user_settings {
    action     = "CLIPBOARD_COPY_FROM_LOCAL_DEVICE"
    permission = "ENABLED"
  }
  user_settings {
    action     = "CLIPBOARD_COPY_TO_LOCAL_DEVICE"
    permission = "ENABLED"
  }
  user_settings {
    action     = "DOMAIN_PASSWORD_SIGNIN"
    permission = "ENABLED"
  }
  user_settings {
    action     = "DOMAIN_SMART_CARD_SIGNIN"
    permission = "DISABLED"
  }
  user_settings {
    action     = "FILE_DOWNLOAD"
    permission = "ENABLED"
  }
  user_settings {
    action     = "FILE_UPLOAD"
    permission = "ENABLED"
  }
  user_settings {
    action     = "PRINTING_TO_LOCAL_DEVICE"
    permission = "ENABLED"
  }

  application_settings {
    enabled        = true
    settings_group = "SettingsGroup"
  }

  streaming_experience_settings {
    preferred_protocol = "TCP"
  }

  tags = {
    TagName = "TagValue"
  }
}