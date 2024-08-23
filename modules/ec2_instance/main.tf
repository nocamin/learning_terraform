provider "aws" {
  alias = var.region
}
resource "aws_instance" "noc" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags          = var.tags

  user_data = templatefile("${path.module}/../templates/userdata_internal.sh", {
    s3_bucket = var.s3_bucket
    region    = var.region
  })
}

