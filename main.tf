module "ec2_us_east_1" {
  source        = "./modules/ec2"
 # region        = "us-east-1"
 # ami_id        = var.ami_map["us-east-1"]
  for_each = toset(var.regions)
  #provider = aws[each.key]
  ami      = data.aws_ami.amazon_linux_2023[each.key].id
  instance_type = var.instance_type
 s3_bucket_name = var.s3_bucket_name
 default_region = var.default_region
  user_data = templatefile("${path.module}/templates/user_data.sh", {
    s3_bucket_name = var.s3_bucket_name,
    default_region = var.default_region
  })
  providers = {
    aws = aws.us-east-1
  }
}

module "ec2_us_west_2" {
  source        = "./modules/ec2"
  #region        = "us-west-2"
  #ami_id        = var.ami_map["us-west-2"]
  for_each = toset(var.regions)
 # provider = aws[each.key]
  ami      = data.aws_ami.amazon_linux_2023[each.key].id
  instance_type = var.instance_type
 s3_bucket_name = var.s3_bucket_name
 default_region = var.default_region
  user_data = templatefile("${path.module}/templates/user_data.sh", {
    s3_bucket_name = var.s3_bucket_name,
    default_region = var.default_region
  })
  providers = {
    aws = aws.us-west-2
  }
}

# Repeat for other regions...

