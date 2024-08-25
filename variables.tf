# variables.tf

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "default_region" {
  description = "The default region for AWS resources"
  type        = string
}

variable "ami_map" {
  description = "Mapping of region to AMI ID"
  type        = map(string)
}
