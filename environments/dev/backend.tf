terraform {
  backend "s3" {
    bucket         = "aws-backend-s3-assets-tfstate-2688"
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile   = true # Bloquea el archivo de estado para evitar cambios simultáneos.
    encrypt        = true
  }
}
