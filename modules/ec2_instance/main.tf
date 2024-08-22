terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
#      version = "~> 3.0"
    }
  }
}


resource "aws_instance" "noc" {
  ami           = var.ami_id
  instance_type = var.instance_type
#  key_name      = var.key_name

  tags = var.tags
}
