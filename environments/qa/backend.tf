terraform {
  backend "s3" {
    bucket         = "aws-backend-s3-assets-tfstate-2688"
    key            = "env/qa/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "backend-dynamodb-assets-tfstate"
    encrypt        = true
  }
}
