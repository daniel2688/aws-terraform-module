# AWS Terraform Module

Este módulo de Terraform está diseñado para gestionar recursos en tres ambientes: **QA**, **Dev** y **Prod**. Proporciona una configuración reutilizable y consistente para implementar infraestructura en AWS.

## Características

- Configuración para tres ambientes: QA, Dev y Prod.
- Modularidad para facilitar la reutilización.
- Compatible con las mejores prácticas de Terraform.

## Estructura del Módulo

```
/aws-terraform-module

├── README.md
├── azure-pipelines.yml
├── bootstrap
│   ├── main.tf
│   ├── outputs.tf
│   ├── terraform.tfstate
│   └── terraform.tfstate.backup
├── environments
│   ├── dev
│   │   ├── backend.tf
│   │   ├── locals.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfstate
│   │   ├── terraform.tfstate.backup
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   ├── prod
│   │   ├── backend.tf
│   │   ├── locals.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfstate
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   └── qa
│       ├── backend.tf
│       ├── locals.tf
│       ├── main.tf
│       ├── outputs.tf
│       ├── terraform.tfstate
│       ├── terraform.tfstate.backup
│       ├── terraform.tfvars
│       └── variables.tf
├── modules
│   ├── alb_autoscaling
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── backend
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── data_processing
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── database
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── frontend
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── networking
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── security
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
└── provider.tf

13 directories, 51 files
```

## Requisitos

- Terraform >= 1.0
- AWS CLI configurado
- Credenciales de AWS con permisos adecuados

## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o un pull request para sugerir mejoras.
