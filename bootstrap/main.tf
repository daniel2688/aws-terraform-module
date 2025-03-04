# Definición del bucket S3 único para todos los ambientes
resource "aws_s3_bucket" "terraform_backend" {
  bucket = "aws-backend-s3-assets-tfstate-2688"

  tags = {
    Name        = "aws-backend-s3-assets-tfstate-2688"
    ManagedBy   = "Terraform"
    Project     = "auna"

  }
}

# Configuración de encriptación para el bucket S3
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.terraform_backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Habilitar el versionado en el bucket
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_backend.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Crear una única tabla DynamoDB para gestionar los locks de todos los entornos
resource "aws_dynamodb_table" "terraform_backend_lock" {
  name         = "backend-dynamodb-assets-tfstate"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "backend-dynamodb-assets-tfstate"
    ManagedBy   = "Terraform"
    Project     = "auna"
  }
}
