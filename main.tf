module "ec2_us_east_1" {
  source = "./modules/ec2_instance"

  providers = {
    aws = aws.us-1
  }

  instance_type = "t2.micro"
  ami_id        = "ami-0e86e20dae9224db8"
  s3_bucket     = module.noc_services_s3_bucket.id
  tags          = {
    Name = "EC2-US-East-1"
  }
}

module "ec2_us_west_2" {
  source = "./modules/ec2_instance"

  providers = {
    aws = aws.us-2
  }

  instance_type = "t2.micro"
  ami_id        = "ami-05134c8ef96964280"
  s3_bucket     = module.noc_services_s3_bucket.id
  tags          = {
    Name = "EC2-US-West-2"
  }
}

module "ec2_eu_west_1" {
  source = "./modules/ec2_instance"

  providers = {
    aws = aws.eu-1
  }

  instance_type = "t2.micro"
  s3_bucket     = module.noc_services_s3_bucket.id
  ami_id        = "ami-03cc8375791cb8bcf"
  tags          = {
    Name = "EC2-EU-West-1"
  }
}

module "ec2_ap_southeast_1" {
  source = "./modules/ec2_instance"

  providers = {
    aws = aws.ap-se-1
  }

  instance_type = "t2.micro"
  ami_id        = "ami-01811d4912b4ccb26"
  s3_bucket     = module.noc_services_s3_bucket.id
  tags          = {
    Name = "EC2-AP-Southeast-1"
  }
}

module "ec2_ap_southeast_2" {
  source = "./modules/ec2_instance"

  providers = {
    aws = aws.ap-se-2
  }

  instance_type = "t2.micro"
  ami_id        = "ami-0892a9c01908fafd1"
  s3_bucket     = module.noc_services_s3_bucket.id
  tags          = {
    Name = "EC2-AP-Southeast-2"
  }
}

module "ec2_ap_northeast_1" {
  source = "./modules/ec2_instance"

  providers = {
    aws = aws.ap-ne-1
  }

  instance_type = "t2.micro"
  ami_id        = "ami-0cab37bd176bb80d3"
  s3_bucket     = module.noc_services_s3_bucket.id
  tags          = {
    Name = "EC2-AP-Northeast-1"
  }
}

module "ec2_sa_east_1" {
  source = "./modules/ec2_instance"

  providers = {
    aws = aws.sae-1
  }

  instance_type = "t2.micro"
  ami_id        = "ami-01a38093d387a7497"
  s3_bucket     = module.noc_services_s3_bucket.id
  tags          = {
    Name = "EC2-SA-East-1"
  }
}
