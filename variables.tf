variable "default_region" {
  description = "Default region where S3 bucket will be created"
  type        = string
  default     = "us-east-1"
}

variable "ami_map" {
  description = "Mapping of region to AMI ID"
  type = map(string)
  default = {
    "us-east-1"      = "ami-0e86e20dae9224db8"
    "us-west-2"      = "ami-05134c8ef96964280"
    "eu-west-1"      = "ami-03cc8375791cb8bcf"
    "ap-southeast-1" = "ami-01811d4912b4ccb26"
    "ap-southeast-2" = "ami-0892a9c01908fafd1"
    "ap-northeast-1" = "ami-0cab37bd176bb80d3"
    "sa-east-1"      = "ami-01a38093d387a7497"
    
  }
}

variable "providers_list" {
  type = list(string)
  default = ["us-east-1", "us-west-2", "eu-west-1", "ap-southeast-1", "ap-southeast-2", "ap-northeast-1", "sa-east-1"]
  # Define aliases as needed...
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-ansible-bucket"
}

variable "user_data" {
  description = "User data script"
  type        = string
}
