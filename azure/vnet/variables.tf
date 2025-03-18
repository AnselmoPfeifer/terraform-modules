variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "name" {
  description = "The name of the virtual network"
  type        = string
}

variable "location" {
  description = "The location of the virtual network"
  type        = string
}

variable "environment" {
  description = "The environment of the virtual network"
  type        = string
}

variable "address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "The subnets of the virtual network"
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))
  default = []
}

variable "tags" {
  description = "The tags of the virtual network"
  type        = map(string)
  default     = {}
}

variable "encryption_enforcement" {
  description = "Specifies the encryption enforcement policy ('AllowUnencrypted', 'DropUnencrypted')"
  type        = string
  default     = "None"

  validation {
    condition     = contains(["AllowUnencrypted", "DropUnencrypted", "None"], var.encryption_enforcement)
    error_message = "encryption_enforcement must be one of: AllowUnencrypted, DropUnencrypted, or None"
  }
}

variable "ddos_protection_plan" {
  description = "DDoS protection plan configuration"
  type = object({
    enable = bool
    id     = string
  })
  default = {
    enable = false
    id     = null
  }
}
