resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
# key_name      = var.key_name
  tags          = var.tags
}
