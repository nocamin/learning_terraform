# providers.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


# providers.tf
# Define provider configurations with unique aliases for each region
provider "aws" {
  alias  = "regional_0"
  region = var.regions[0]
}

provider "aws" {
  alias  = "regional_1"
  region = var.regions[1]
}

provider "aws" {
  alias  = "regional_2"
  region = var.regions[2]
}
