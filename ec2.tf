

# main.tf
resource "aws_instance" "example" {
  count = length(var.regions)
  ami   = lookup(var.region_ami_map, var.regions[count.index])
  instance_type = "t2.micro"
  provider = aws.regional_
  tags = {
    Name = "example-instance-${var.regions[count.index]}"
  }
}


