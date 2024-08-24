variable "region" {
  description = "Region for the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

#variable "user_data" {
#  description = "User data script"
#  type        = string
#}
