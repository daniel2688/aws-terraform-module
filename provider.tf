terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {                     # Sección donde se define el proveedor requerido (en este caso, AWS).
      source  = "hashicorp/aws" # Especifica que el proveedor AWS será descargado desde HashiCorp Registry.
      version = ">= 5.89"       # Define que se usará la versión 5.89 o superior del proveedor AWS.
    }
    random = {                     # Sección donde se define el proveedor requerido (en este caso, Random).
      source  = "hashicorp/random" # Especifica que el proveedor Random será descargado desde HashiCorp Registry.
      version = "3.4"              # Define que se usará la versión 3.4 o superior del proveedor Random.
    }
    local = {                     # Sección donde se define el proveedor requerido (en este caso, Local).
      source  = "hashicorp/local" # Especifica que el proveedor Local será descargado desde HashiCorp Registry.
      version = "2.2"             # Define que se usará la versión 2.2 o superior del proveedor Local.
    }
    tls = {                     # Sección donde se define el proveedor requerido (en este caso, TLS).
      source  = "hashicorp/tls" # Especifica que el proveedor TLS será descargado desde HashiCorp Registry.
      version = "3.0"           # Define que se usará la versión 5.0 o superior del proveedor TLS.
    }
  }
}

provider "aws" {
  region = var.tags["region"]

  default_tags {
    tags = {
      Environment = var.tags["environment"]
      Project     = var.tags["project"]
      Owner       = var.tags["owner"]
      ManagedBy   = "Terraform"
    }
  }
}
