output "address" {
    value           = module.mysql.address
    description     = "Connect to the database at this end point"
}

output "port" {
    value           = module.mysql.port
    description     = "The port the database is listening on"

}