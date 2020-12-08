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

resource "aws_instance" "example" {
    ami = "ami-2757f631"
    instance_type = "t2.micro"

    tags = {
        Name = "terraform-example"
    }

}
