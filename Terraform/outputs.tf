output "vpc_id" {
  description = "Id of the custom vpc"
  value       = module.vpc.vpc_id
}

output "rds_endpoint" {
  description = "Endpoint for RDS instance "
  value       = module.db.db_instance_endpoint
}