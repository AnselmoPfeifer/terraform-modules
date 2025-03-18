output "id" {
  value = azurerm_virtual_network.this.id
}

output "name" {
  value = azurerm_virtual_network.this.name
}

output "location" {
  value = azurerm_virtual_network.this.location
}

output "address_space" {
  value = azurerm_virtual_network.this.address_space
}

output "subnets" {
  value = azurerm_virtual_network.this.subnet
}

output "tags" {
  value = azurerm_virtual_network.this.tags
}
