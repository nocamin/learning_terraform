resource "aws_s3_bucket" "ansible_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name = "Ansible Roles Bucket"
  }
}

resource "aws_s3_bucket_object" "ansible_zip" {
  bucket = aws_s3_bucket.ansible_bucket.bucket
  key    = "ansible/roles.zip"
  source = "${path.module}/ansible/roles.zip"
}

