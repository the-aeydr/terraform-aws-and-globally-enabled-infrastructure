module "us-west-1" {
  source = "./modules/sample"

  regions = local.regions
}

module "us-west-2" {
  source = "./modules/sample"

  regions = local.regions
}

module "us-east-2" {
  source = "./modules/sample"

  regions = local.regions
}

locals {
  results = [
    module.us-west-1.results,
    module.us-west-2.results,
    module.us-east-2.results,
  ]
}
