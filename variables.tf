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
