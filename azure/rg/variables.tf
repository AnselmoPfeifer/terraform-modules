variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "dev"
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
  default     = "westeurope"
}

variable "resource_group_tags" {
  description = "The tags of the resource group"
  type        = map(string)
  default     = {}
}
