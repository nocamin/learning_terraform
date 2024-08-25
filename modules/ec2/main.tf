# modules/ec2/main.tf

resource "aws_instance" "noc" {
  ami           = var.ami_id
  instance_type = var.instance_type
  user_data     = var.user_data
  tags = {
    Name = "EC2-${var.region}"
  }
}
