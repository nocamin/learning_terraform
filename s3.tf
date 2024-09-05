#Random number generate for uniqueness of S3 bucket name

#resource "random_id" "prefix" {
#  byte_length = 4  # Generates an 8-character string (2 characters per byte)
#}
#

# Create S3 bucket to store Ansible playbooks
module "noc_services_s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.1"

  bucket = "${var.default_region}-${var.s3_bucket_name}"  # Combine the random prefix with the bucket name
}

# Zip the Ansible playbook directory
data "archive_file" "ansible_playbook" {
  type        = "zip"
  source_dir  = "${path.module}/ansible/playbook"
  output_path = "${path.module}/ansible/playbook.zip"
}

# Upload the zipped playbook to the S3 bucket
resource "aws_s3_object" "ansible_playbook" {
  bucket = "${var.default_region}-${var.s3_bucket_name}"      # Reference the bucket from the module
  key    = "playbook.zip"
  source = data.archive_file.ansible_playbook.output_path

  etag = data.archive_file.ansible_playbook.output_md5

  depends_on = [module.noc_services_s3_bucket]
}

