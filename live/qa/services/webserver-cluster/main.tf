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

terraform {
    backend "s3" {
        # Replace this with your bucket name
        bucket              = "web-global-state"
        key                 = "qa/service/webserver-cluster/terraform.tfstate"
        region              = "us-east-1"

        # Replace this with your DynamoDB table name!
        dynamodb_table      = "web-global-locks"
        encrypt             = true
    }
}

module "webserver_cluster" {
    source = "../../../../modules/services/webserver-cluster"

    ami                       = "ami-2757f631"
    server_text               = "New server text"
    cluster_name              = var.cluster_name
    db_remote_state_bucket    = var.db_remote_state_bucket
    db_remote_state_key       = var.db_remote_state_key 

    instance_type = "t2.micro"
    min_size      = 2
    max_size      = 4
    enable_autoscaling = false 
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  type                      = "ingress"
  security_group_id         = module.webserver_cluster.alb_security_group_id

  from_port                 = 12345
  to_port                   = 12345
  protocol                  = "tcp"
  cidr_blocks               = ["0.0.0.0/0"]
}
