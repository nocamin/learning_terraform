# main.tf

# Local variable to define the regions and their corresponding AMIs
locals {
  regions = {
    "us-east-1" = {
      provider_alias = "us-east-1"
      ami_id         = data.aws_ami.us_east_1.id
    }
    "us-west-2" = {
      provider_alias = "us-west-2"
      ami_id         = data.aws_ami.us_west_2.id
    }
  }

  instance_type  = var.instance_type
  s3_bucket_name = var.s3_bucket_name
}

# Create EC2 instances across all regions
module "ec2_instances" {
  for_each = local.regions

  source        = "./modules/ec2"
  region        = each.key
  ami_id        = each.value.ami_id
  instance_type = local.instance_type
  s3_bucket_name = local.s3_bucket_name

  user_data = templatefile("${path.module}/templates/user_data.sh", {
    s3_bucket_name  = local.s3_bucket_name,
    default_region = var.default_region
  })

  providers = {
    aws = aws.${each.value.provider_alias}  # Reference provider alias directly
  }
}
