resource "random_string" "secret_suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "aws_secretsmanager_secret" "app_secrets" {
  name = "${var.project_name}-secrets-${random_string.secret_suffix.result}"
}

resource "aws_secretsmanager_secret_version" "app_secret_version" {
  secret_id = aws_secretsmanager_secret.app_secrets.id
  secret_string = jsonencode({
    DB_NAME           = var.db_name
    DB_USER           = var.db_username
    DB_PASSWORD       = var.db_password
    DB_HOST           = aws_db_instance.mysql.endpoint
    DB_PORT           = "3306"
    DJANGO_SECRET_KEY = var.django_secret_key
  })
}