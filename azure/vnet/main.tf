resource "azurerm_virtual_network" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan.enable ? [1] : []
    content {
      enable = var.ddos_protection_plan.enable
      id     = var.ddos_protection_plan.enable ? azurerm_network_ddos_protection_plan.this[0].id : null
    }
  }

  dynamic "encryption" {
    for_each = var.encryption_enforcement != "None" ? [1] : []
    content {
      enforcement = var.encryption_enforcement
    }
  }

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }
  }
  dns_servers = []

  tags = var.tags
}

resource "azurerm_network_ddos_protection_plan" "this" {
  count               = var.ddos_protection_plan.enable ? 1 : 0
  name                = "${var.name}-ddos-protection-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
}
