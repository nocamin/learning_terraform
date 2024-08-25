# variables.tf

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to store Ansible playbooks"
  type        = string
}

variable "default_region" {
  description = "Default AWS region"
  type        = string
}

variable "ami_map" {
  description = "Map of AMI IDs for different regions"
  type        = map(string)
}
