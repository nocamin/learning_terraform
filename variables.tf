# variables.tf

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to store Ansible playbooks"
  type        = string
  default     = "nocping-bucket"
}

variable "default_region" {
  description = "Default AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami_map" {
  description = "Map of AMI IDs for different regions"
  type        = map(string)
  default = {
    "us-east-1"      = "ami-0182f373e66f89c85"
    "us-west-2"      = "ami-0bfddf4206f1fa7b9"
  }
}
