locals {
  # Create a map that links each region to the actual provider object
  provider_map = {
    for region, alias in var.region_provider_map :
    region => aws[alias]
  }
}

module "ec2_instances" {
  source        = "./modules/ec2"

  for_each      = var.region_ami_map
  region        = each.key
  ami_id        = each.value
  instance_type = var.instance_type
  user_data     = templatefile("${path.module}/templates/user_data.sh", {})

  providers = {
    aws = local.provider_map[each.key]
  }
}
