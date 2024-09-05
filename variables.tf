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

variable "regions" {
  description = "List of AWS regions to find the Amazon Linux 2023 AMI"
  type        = list(string)
  default     = ["us-west-2", "us-east-1", "eu-west-1", "eu-central-1", "ap-south-1", "ap-northeast-1", "ap-southeast-2"]
}
