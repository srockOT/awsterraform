variable "db_password" {
  description = "The password for the database"
  type        = string
  default     = "password"
}

variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = "database_qa"
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  default     = "admin"
}
