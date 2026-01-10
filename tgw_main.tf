module "us-west-1_prop" {
  source = "./modules/prop"

  connectors = [for res in local.results : res["us-west-1"]]
}

module "us-west-2_prop" {
  source = "./modules/prop"

  connectors = [for res in local.results : res["us-west-2"]]
}

module "us-east-2_prop" {
  source = "./modules/prop"

  connectors = [for res in local.results : res["us-east-2"]]
}
