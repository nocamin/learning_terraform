# outputs.tf

output "s3_bucket_name" {
  value = module.noc_services_s3_bucket.bucket
}

output "ec2_instance_ids" {
  value = { for region, mod in module.ec2 : region => mod.instance_id }
}
