# main.tf

# Local variable to define the regions and their corresponding AMIs
locals {
  regions = {
    "us-east-1" = {
      provider = aws.us-east-1
      ami_id   = data.aws_ami.us_east_1.id
    }
    "us-west-2" = {
      provider = aws.us-west-2
      ami_id   = data.aws_ami.us_west_2.id
    }
  }

  common_vars = {
    instance_type  = var.instance_type
    s3_bucket_name = var.s3_bucket_name
    default_region = var.default_region
  }
}

# Loop over each region to create EC2 instances
module "ec2_instances" {
  for_each = local.regions

  source        = "./modules/ec2"
  region        = each.key
  ami_id        = each.value.ami_id
  instance_type = local.common_vars.instance_type
  s3_bucket_name = local.common_vars.s3_bucket_name
  default_region = local.common_vars.default_region

  user_data = templatefile("${path.module}/templates/user_data.sh", {
    s3_bucket_name = local.common_vars.s3_bucket_name,
    default_region = local.common_vars.default_region
  })

  providers = {
    aws = each.value.provider
  }
}
