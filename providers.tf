# providers.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#provider "aws" {
#  alias  = "us-east-1"
#  region = "us-east-1"
#}
#
#provider "aws" {
#  alias  = "us-west-2"
#  region = "us-west-2"
#}

provider "aws" {
  region = var.default_region
}

provider "aws" {
  alias  = each.value
  region = each.value
}

resource "null_resource" "dummy" {
  for_each = toset(var.regions)
}

