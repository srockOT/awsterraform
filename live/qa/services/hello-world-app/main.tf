terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.19"
}
}
}

provider "aws" {
  region = "us-east-1"
}

#terraform {
#    backend "s3" {
        # Replace this with your bucket name
#        bucket              = "web-global-state"
#        key                 = "qa/service/webserver-cluster/terraform.tfstate"
#        region              = "us-east-1"

        # Replace this with your DynamoDB table name!
#        dynamodb_table      = "web-global-locks"
#        encrypt             = true
#    }
#}

module "hello_world_app" {
    source = "../../../../modules/services/hello-world-app"

    server_text               = var.server_text
    environment               = var.environment
    db_remote_state_bucket    = var.db_remote_state_bucket
    db_remote_state_key       = var.db_remote_state_key 

    instance_type = "t2.micro"
    min_size      = 2
    max_size      = 4
    enable_autoscaling = false 
}
