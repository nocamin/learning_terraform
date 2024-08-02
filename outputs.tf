output "instance_ami" {
  value = aws_instance.noc
}

output "instance_arn" {
  value = aws_instance.noc.arn
}
