module "ec2_instances" {
  source = "./modules/ec2"

  for_each       = var.region_ami_map
  region         = each.key
  ami_id         = each.value
  instance_type  = var.instance_type
  user_data      = templatefile("${path.module}/templates/user_data.sh", {})
  providers = {
    aws = aws[lookup(var.region_provider_map, each.key)]
  }  

#  providers = {
#    aws = lookup(
#      map(
#        "us-east-1", aws.us-east-1,
#        "us-west-2", aws.us-west-2,
#        "eu-west-1", aws.eu-west-1,
#        "ap-southeast-1", aws.ap-southeast-1,
#        "ap-southeast-2", aws.ap-southeast-2,
#        "ap-northeast-1", aws.ap-northeast-1,
#        "sa-east-1", aws.sa-east-1
#        # Add other regions and aliases...
#      ), each.key)
#  }
#
  #providers = {
  #  aws = aws[lookup(var.providers_list, index(keys(var.region_ami_map), each.key))]
  # }
}
