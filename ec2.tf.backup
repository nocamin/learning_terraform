

# variables.tf
variable "regions" {
  type    = list(string)
  default = ["us-east-1", "us-west-2", "eu-west-1"]
}

variable "region_ami_map" {
  type = map(string)
  default = {
    "us-east-1" = "ami-0e86e20dae9224db8",
    "us-west-2" = "ami-05134c8ef96964280",
    "eu-west-1" = "ami-03cc8375791cb8bcf"
  }
}



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

# main.tf
resource "aws_instance" "example" {
  count = length(var.regions)

  ami           = lookup(var.region_ami_map, var.regions[count.index])
  instance_type = "t2.micro"

  provider = aws.regional[count.index] # Selects the provider alias based on the index
  tags = {
    Name = "example-instance-${var.regions[count.index]}"
  }
}

#output.tf 

output "instance_public_ips" {
  value = [for idx in range(length(var.regions)) : aws_instance.example[idx].public_ip]
}

output "instance_ids" {
  value = [for idx in range(length(var.regions)) : aws_instance.example[idx].id]
}

