# Create S3 bucket to store Ansible playbooks
module "noc_services_s3_bucket" {
  source  = "registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws"
  version = "4.1.1"

  bucket = "${var.aws_account_id}-noc-services"
}

# Zip the Ansible playbook directory
data "archive_file" "ansible_playbook" {
  type        = "zip"
  source_dir  = "${path.module}/ansible/playbook"
  output_path = "${path.module}/ansible/playbook.zip"
}

# Upload the zipped playbook to the S3 bucket
resource "aws_s3_object" "ansible_playbook" {
  bucket = module.noc_services_s3_bucket.id
  key    = "playbook.zip"
  source = data.archive_file.ansible_playbook.output_path

  etag = data.archive_file.ansible_playbook.output_md5
}
