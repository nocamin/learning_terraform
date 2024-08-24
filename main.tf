module "ec2_us_east_1" {
  source        = "./modules/ec2"
  region        = "us-east-1"
  ami_id        = var.ami_map["us-east-1"]
  instance_type = var.instance_type
 s3_bucket_name = var.s3_bucket_name
  user_data = templatefile("${path.module}/templates/user_data.sh", {
    s3_bucket_name = var.s3_bucket_name,
  })
  providers = {
    aws = aws.us-east-1
  }
}

module "ec2_us_west_2" {
  source        = "./modules/ec2"
  region        = "us-west-2"
  ami_id        = var.ami_map["us-west-2"]
  instance_type = var.instance_type
 s3_bucket_name = var.s3_bucket_name
  user_data = templatefile("${path.module}/templates/user_data.sh", {
    s3_bucket_name = var.s3_bucket_name,
  })
  providers = {
    aws = aws.us-west-2
  }
}

# Repeat for other regions...

