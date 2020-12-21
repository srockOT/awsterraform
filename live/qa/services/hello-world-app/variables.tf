variable "db_remote_state_bucket" {
    description = "The name of the S3 bucket used for the database's remote state storage"
    type = string
    default = "web-global-state"
}

variable "db_remote_state_key" {
    description  = "The name of the key in the S3 bucket used for the database's remote state storage"
    type = string 
    default = "qa/data-stores/mysql/terraform.tfstate"
}

variable "server_text" {
  description = "The text the web server should return"
  default     = "Hello, World"
  type        = string
}

variable "environment" {
  description = "The name of the environment we're deploying to"
  type        = string
  default     = "qa"
}
