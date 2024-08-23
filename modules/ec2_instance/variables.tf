variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "specify region to instance"
  type = string
}

variable "s3_bucket" {
  description = "S3 bucket variable"
  type = string
}
