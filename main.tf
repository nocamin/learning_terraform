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

# Define EC2 module for us-east-1 region
module "ec2_us_east_1" {
  source        = "./modules/ec2"
  region        = "us-east-1"
  ami_id        = local.regions["us-east-1"].ami_id
  instance_type = local.instance_type
  s3_bucket_name = local.s3_bucket_name
  default_region = var.default_region

  user_data = templatefile("${path.module}/templates/user_data.sh", {
    s3_bucket_name  = local.s3_bucket_name,
    default_region = var.default_region
  })

  providers = {
    aws = aws.us-east-1
  }
}

# Define EC2 module for us-west-2 region
module "ec2_us_west_2" {
  source        = "./modules/ec2"
  region        = "us-west-2"
  ami_id        = local.regions["us-west-2"].ami_id
  instance_type = local.instance_type
  s3_bucket_name = local.s3_bucket_name
  default_region = var.default_region
  user_data = templatefile("${path.module}/templates/user_data.sh", {
    s3_bucket_name  = local.s3_bucket_name,
    default_region = var.default_region
  })

  providers = {
    aws = aws.us-west-2
  }
}
