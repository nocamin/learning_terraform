# providers.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "regions" {
  type    = list(string)
  default = ["us-east-1", "us-west-1"]
}

provider "aws" {
  alias  = "var.regions[count.index]"
  region = var.regions[count.index]
}

resource "aws_instance" "example" {
  count    = length(var.regions)
  provider = aws.regions[count.index]
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  # Other arguments
}

