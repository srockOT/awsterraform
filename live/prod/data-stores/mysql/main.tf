provider "aws" {
    region = "us-east-1"
}

terraform {
    backend "s3" {
        # Replace this with your bucket name
        bucket              = "web-global-state"
        key                 = "prod/data-stores/mysql/terraform.tfstate"
        region              = "us-east-1"

        # Replace this with your DynamoDB table name!
        dynamodb_table      = "web-global-locks"
        encrypt             = true
    }
}

module "mysql" {
    source = "../../../../modules/data-sources/mysql"
    db_name = var.db_name
    db_username = var.db_username
    db_password = var.db_password
}