locals {
    results = {
        "us-west-1": "abc",
        "us-west-2": "yzs",
        "us-east-2": "45dxfgds",
    }
}

resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

resource "random_string" "sets" {
    for_each = var.regions

  length           = 16
  special          = true
  override_special = "/@£$"
}

output "results" {
    value = local.results
}

variable "regions" {
    type = set(string)
}