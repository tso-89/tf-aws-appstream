// Appstream Fleet Variable Resources
variable "tags" {
  description = "Tags"
  type = map(string)
  default = {}
}

variable "connector_type" {
  description = "(Required) Type of storage connector. Valid values are HOMEFOLDERS, GOOGLE_DRIVE, or ONE_DRIVE."
  type = string
  default = null
}

variable "compute_capacity" {
  description = "(Required) Configuration block for the desired capacity of the fleet. See below."
  type = number
}

variable "directory_config_name" {
  description = "Fully qualified name of the directory"
  type = string
  default = null
}

variable "directory_config_ou" {
  description = " (Required) Distinguished names of the organizational units for computer accounts."
  type = list(string)
  default = null
}

variable "directory_config_account" {
  description = "(Required) User name of the account. This account must have the following privileges: create computer objects, join computers to the domain, and change/reset the password on descendant computer objects for the organizational units specified."
  type = string
  default = null
}

variable "directory_config_password" {
  description = "(Required) Password for the account."
  type = string
  default = null
}

variable "desired_instances" {
  description = "(Required) Desired number of streaming instances."
  type = number
  default = null
}

variable "directory_name" {
  description = "Fully qualified name of the directory"
  type = string
  default = null
}

variable "disconnect_timeout_in_seconds" {
  description = "(Optional) Amount of time that a streaming session remains active after users disconnect."
  type = string
  default = null
}

variable "domains" {
  description = "(Optional) Names of the domains for the account."
  type = list(string)
  default = null
}

variable "enable_default_internet_access" {
  description = "(Optional) Enables or disables default internet access for the fleet."
  type = bool
  default = false
}

variable "enabled" {
  description = "(Required) Whether application settings should be persisted."
  type = bool
  default = false
}

variable "endpoint_type" {
  description = "(Required) Type of the interface endpoint. See the AccessEndpoint AWS API documentation for valid values."
  type = string
  default = null
}

variable "feedback_url" {
  description = "(Optional) URL that users are redirected to after they click the Send Feedback link. If no URL is specified, no Send Feedback link is displayed."
  type = string
  default = null
}

variable "fleet_description" {
  description = "(Optional) Description to display."
  type = string
  default = null
}

variable "fleet_display_name" {
  description = "(Optional) Human-readable friendly name for the AppStream fleet."
  type = string
  default = null
}

variable "fleet_name" {
  description = "(Required) Unique name for the fleet."
  type = string
}

variable "fleet_type" {
  description = "(Optional) Fleet type. Valid values are: ON_DEMAND, ALWAYS_ON"
  type = string
  default = "ON_DEMAND"

  //add Validation for only allowing ON_DEMAND or ALWAYS_ON
}

variable "iam_role_arn" {
  
}

variable "idle_disconnect_timeout_in_seconds" {
  description = "(Optional) Amount of time that users can be idle (inactive) before they are disconnected from their streaming session and the disconnect_timeout_in_seconds time interval begins."
  type = number
  default = null
}

variable "imagine_builder_decription" {
  description = "(Optional) Description to display."
  type = string
  default = null
}

variable "imagine_builder_display_name" {
  description = "(Optional) Human-readable friendly name for the AppStream image builder."
  type = string
  default = null
}

variable "imagine_builder_enable_internet_access" {
  description = "(Optional) Enables or disables default internet access for the image builder."
  type = string
  default = null
}

variable "imagine_builder_instance_type" {
  description = "(Required) Instance type to use when launching the image builder."
  type = string
  default = null
}

variable "imagine_builder_image_name" {
  description = " (Optional, Required if image_arn not provided) Name of the image used to create the image builder."
  type = string
  default = null
}

variable "imagine_builder_name" {
  description = "(Required) Unique name for the image builder."
  type = string
  default = null
}

variable "image_name" {
  description = "(Optional) Name of the image used to create the fleet."
  type = string
  default = null
}

variable "instance_type" {
  description = "(Required) Instance type to use when launching fleet instances."
  type = string
  default = "stream.standard.large"
}

variable "image_arn" {
  
}

variable "max_user_duration_in_seconds" {
  description = "(Optional) Maximum amount of time that a streaming session can remain active, in seconds."
  type = number
  default = null
}

variable "organizational_unit_distinguished_name" {
  description = "(Optional) Distinguished name of the organizational unit for computer accounts."
  type = string
  default = null
}

variable "preferred_protocol" {
  description = "(Optional) The preferred protocol that you want to use while streaming your application. Valid values are TCP and UDP."
  type = string
  default = "TCP"
}

variable "redirect_url" {
  description = "(Optional) URL that users are redirected to after their streaming session ends."
  type = string
  default = null
}

variable "resource_identifier" {
  description = "(Optional) ARN of the storage connector."
  type = string
  default = null
}

variable "security_group_ids" {
  description = "Identifiers of the security groups for the fleet or image builder."
  type = list(string)
  default = []
}

variable "settings_group" {
  description = "(Optional) Name of the settings group. Required when enabled is true. Can be up to 100 characters."
  type = string
  default = null
}

variable "subnet_ids" {
  description = "Identifiers of the security groups for the fleet or image builder."
  type = list(string)
  default = []
}

variable "stack_name" {
  description = "(Required) Unique name for the AppStream stack."
  type = string
  default = null
}

variable "stack_description" {
  description = "(Optional) Description for the AppStream stack."
  type = string
  default = null
}

variable "stack_display_name" {
  description = "(Optional) Stack name to display."
  type = string
  default = null
}

variable "stream_view" {
  
}

variable "user_settings" {
  description = "(Optional) Configuration block for the actions that are enabled or disabled for users during their streaming sessions. If not provided, these settings are configured automatically by AWS. If provided, the terraform configuration should include a block for each configurable action"
  type = list(map(string))
  default = []
}

variable "vpce_id" {
  description = "(Optional) ID of the VPC in which the interface endpoint is used."
  type = string
  default = null
}