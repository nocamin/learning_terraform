module "ec2_instance" {
  source = "./modules/ec2"

  for_each       = var.region_ami_map
  region         = each.key
  ami_id         = each.value
  instance_type  = var.instance_type
  user_data      = templatefile("${path.module}/templates/user_data.sh", {})
  providers      = { aws = aws.${each.key} }
}

module "s3_bucket" {
  source = "./s3.tf"
  region = var.default_region
  bucket_name = var.s3_bucket_name
  providers = { aws = aws.default }
}
