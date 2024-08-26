

# main.tf
resource "aws_instance" "example" {
  count = length(var.regions)
  ami   = lookup(var.region_ami_map, var.regions[count.index])
  instance_type = "t2.micro"

 # providers = {
 #   aws = aws.regions[count.index]
 # }

  tags = {
    Name = "example-instance-${var.regions[count.index]}"
  }
}


