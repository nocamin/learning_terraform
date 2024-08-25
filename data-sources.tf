# data-sources.tf

data "aws_ami" "us_east_1" {
  provider   = aws.us-east-1
  owners      = ["amazon"]
  most_recent = true
  filter = {
    name = "amzn2-ami-hvm-*-x86_64-gp2"
  }
}

data "aws_ami" "us_west_2" {
  provider   = aws.us-west-2
  owners      = ["amazon"]
  most_recent = true
  filter = {
    name = "amzn2-ami-hvm-*-x86_64-gp2"
  }
}
