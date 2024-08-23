provider "aws" {
  alias = var.region
}
module "ec2_instances" {
  source = "./modules/ec2_instance"

  for_each = toset(var.regions)

  region        = each.value
  ami           = var.ami_map[each.value]
  instance_type = var.instance_type
  s3_bucket     = module.noc_services_s3_bucket.id

  providers = {
    aws = aws[each.key]
  }
}
