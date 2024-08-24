module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "3.0.0"
  region = var.default_region
  bucket_name = var.s3_bucket_name
  providers = { aws = aws.default }
}

resource "aws_s3_bucket" "ansible_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name = "Ansible Roles Bucket"
  }
}

resource "aws_s3_bucket_object" "ansible_zip" {
  bucket = aws_s3_bucket.ansible_bucket.bucket
  key    = "ansible/playbook.zip"
  source = "${path.module}/ansible/playbook.zip"
}

