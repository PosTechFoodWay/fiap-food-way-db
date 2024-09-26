output "postgres_instance_endpoint" {
  description = "Endpoint of the PostgreSQL RDS instance"
  value       = aws_db_instance.foodway_postegres_instance.endpoint
}
