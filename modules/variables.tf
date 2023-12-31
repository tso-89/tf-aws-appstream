// AWS Appstream Directory Config Variables
variable "directory_name" {
  description = "Fully qualified name of the directory"
  type = string
  default = ""
}

variable "organizational_unit_distinguished_names" {
  description = "Distinguished names of the organizational units for computer accounts."
  type = list(string)
  default = []
}

variable "account_name" {
  description = "User name of the account. This account must have the following privileges: create computer objects, join computers to the domain, and change/reset the password on descendant computer objects for the organizational units specified."
  type = string
  default = ""
}

variable "account_password" {
  description = "Password for the AD account."
  type = string
  default = ""
}

// AWS Appstream Image Builder Variables
variable "image_builder_name" {
    description = "Unique name for the image builder."
    type = string
    default = null
}