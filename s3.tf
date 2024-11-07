# Create S3 bucket to store Ansible playbooks
module "noc_services_s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.1"

  bucket = var.s3_bucket_name
}

# Zip the Ansible playbook directory
data "archive_file" "ansible_playbook" {
  type        = "zip"
  source_dir  = "${path.module}/ansible/playbook"
  output_path = "${path.module}/ansible/playbook.zip"
}

# Upload the zipped playbook to the S3 bucket
resource "aws_s3_object" "ansible_playbook" {
  bucket = var.s3_bucket_name     # Reference the bucket from the module
  key    = "playbook.zip"
  source = data.archive_file.ansible_playbook.output_path

  etag = data.archive_file.ansible_playbook.output_md5

  depends_on = [module.noc_services_s3_bucket]
}

