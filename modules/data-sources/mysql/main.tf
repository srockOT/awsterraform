resource "aws_db_instance" "example" {
    identifier_prefix = "web-database"
    engine            = "mysql"
    allocated_storage = 10
    instance_class    = "db.t2.micro"
    name              = var.db_name
    username          = var.db_username

    # How should we set the password
    password = var.db_password
    skip_final_snapshot = true

}