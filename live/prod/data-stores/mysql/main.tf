provider "aws" {
    region = "us-east-1"
}

resource "aws_db_instance" "example" {
    identifier_prefix = "web-database-prod"
    engine            = "mysql"
    allocated_storage = 10
    instance_class    = "db.t2.micro"
    name              = "example_database_prod"
    username          = "admin"

    # How should we set the password
    password = "password"

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