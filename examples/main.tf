provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-dev60"
    key    = "example/sample/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ec2" {
  source = "./ec2"
  SGID   = module.securitygroup.SGID
  name   = ["new1", "new2"]
  instance_type = var.instance_type
  env           = var.env
}

module "securitygroup" {
  source = "./securitygroup"
}

variable "instance_type" {}
variable "env" {}
