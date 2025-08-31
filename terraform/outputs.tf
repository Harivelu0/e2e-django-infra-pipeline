output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "rds_endpoint" {
  value = aws_db_instance.mysql.address
}

output "secrets_manager_arn" {
  value = aws_secretsmanager_secret.app_secrets.arn
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}
