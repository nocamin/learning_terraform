# providers.tf

provider "aws" {
  region = var.default_region
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}

# Fetch the latest Amazon Linux 2 AMI for us-east-1
data "aws_ami" "us_east_1" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  provider = aws.us-east-1
}

# Fetch the latest Amazon Linux 2 AMI for us-west-2
data "aws_ami" "us_west_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  provider = aws.us-west-2
}
