provider "aws" {
  region = var.default_region
  alias  = "default"
}

provider "aws" {
  region = "us-west-2"
  alias  = "us-2"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "eu-1"
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "ap-se-1"
}

provider "aws" {
  region = "ap-southeast-2"
  alias  = "ap-se-2"
}

provider "aws" {
  region = "ap-northeast-1"
  alias  = "ap-ne-1"
}
