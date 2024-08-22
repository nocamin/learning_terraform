terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"  # Ensure this matches your desired AWS provider version
    }
  }
}

resource "aws_instance" "noc" {
  ami           = var.ami_id
  instance_type = var.instance_type
#  key_name      = var.key_name

  tags = var.tags
}
