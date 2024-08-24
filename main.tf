module "ec2_instance" {
  source = "./modules/ec2"

  for_each       = var.region_ami_map
  region         = each.key
  ami_id         = each.value
  instance_type  = var.instance_type
  user_data      = templatefile("${path.module}/templates/user_data.sh", {})
  providers = {
    aws = aws[lookup(var.providers_list, index(keys(var.region_ami_map), each.key))]
  }
}
