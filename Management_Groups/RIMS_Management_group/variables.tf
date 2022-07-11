variable "ParentManagementGroup" {
  type        = string
  description = "parent managementgroup in RIMS"
}

variable "subscription_dmz" {
  type        = string
  description = "subscription_dmz in RIMS"
}

variable "subscription_private" {
  type        = string
  description = "subscription_private in RIMS"
}

variable "RMISdmz_Name" {
  type        = string
  description = "RMISDMZ_Name"
}

variable "RMISdmz_id" {
  type        = string
  description = "RIMSdmz_id"
}

variable "RMISprivate_Name" {
  type        = string
  description = "RMISprivate_Name"
}

variable "RMISprivate_id" {
  type        = string
  description = "RIMSprivate_Name"
}

variable "statename" {
  type = string
  description = "This is the name of the state file"
}
