resource "random_string" "connect_to" {
    for_each = var.connectors

  length           = 16
  special          = true
  override_special = "/@£$"
}

variable "connectors" {
    type = set(string)
}